##=============================================================================##
## Define Helper Functions
##=============================================================================##

## Trim function removes leading and trailing whitespace

trim <- function (x) gsub("^\\s+|\\s+$", "", x)

## Add alpha for maps

add.alpha <- function(col, alpha=1){
  if(missing(col))
    stop("Please provide a vector of colours.")
  apply(sapply(col, col2rgb)/255, 2, 
        function(x) 
          rgb(x[1], x[2], x[3], alpha=alpha))  
}

## Process cv.glmnet output for covariate selection procedure

grabvars <- function(x,s="lambda.1se") {
  coef.out <- coef(x, s=s, exact=TRUE)
  inds <- which(coef.out != 0)
  vars <- as.data.frame(cbind(rownames(coef.out)[inds], coef.out[inds,], abs(coef.out[inds,])))
  vars <- vars[order(vars[,3], decreasing=TRUE),]
  colnames(vars) <- c("variable","coef","abs.coef")
  rownames(vars) <- NULL
  return(list(vars=vars, nvars=nrow(vars)-1))
}


## Bootstrap estimator for covariate adjustment
## Estimate the empirical sandwich variance for each draw, since the
## variance estimate is needed to obtain the Studentized bootstrap CIs

bs = function(data, sims=5000, zvar, Yvar, z0, z1, X0, X1, ipwvar,ptvar){
  
  z1 <- as.numeric(z1); z0 <- as.numeric(z0)
  
  # subset data
  data <- data[data[[zvar]] %in% c(z1,z0),]

  # listwise deletion if obs includes missing data
  data <- data[apply(data[,names(data) %in% c(Yvar,X0,X1)],1,function(x) sum(is.na(x))==0),]

  # index rows so resampling can be done correctly
  data$i <- 1:nrow(data)
  
  # ipw variable
  data$ipw2g <- data[[ipwvar]]
  
  sapply(1:sims, function(j) {
    cat(j," ")
      
    # estimate betas for X from resample of control data  
    i0 = sample(data$i[data[[zvar]]==z0], sum(data[[zvar]]==z0), replace = TRUE)
    b0 = lm(paste(Yvar, " ~ ", paste(X0, collapse="+")), data = data[i0,], weights=ipw2g)
    
    # estimate betas for X from resample of treatment data  
    i1 = sample(data$i[data[[zvar]]==z1], sum(data[[zvar]]==z1), replace = TRUE)
    b1 = lm(paste(Yvar," ~ ", paste(X1, collapse="+")), data = data[i1,], weights=ipw2g)
    
    # estimated treatment effect from resampled data
    data2 <- rbind(data[i1,], data[i0,])
    
    #mean(predict(b1, newdata=data2, se.fit=TRUE, type="response")$fit) - mean(predict(b0, newdata=data2, se.fit=TRUE, type="response")$fit)
    
    esv2g(data=data2,zvar=zvar,Yvar=Yvar,z0=z0,z1=z1,covs0=X0,covs1=X1,ipwvar=ipwvar,ptvar=ptvar)
  })
}



## Empirical sandwich variance estimator
## from Yuan, S., Zhang, H.H., and Davidian, M. (2012). Variable selection for 
## covariate-adjusted semiparametric inference in randomized clinical trials. Statistics in Medicine 31, 3789-3804

esv2g <- function(data,zvar,Yvar,covs0,covs1,z1,z0,ipwvar,ptvar) {
  
  z1 <- as.numeric(z1); z0 <- as.numeric(z0)
  
  # subset data
  sub <- data[data[[zvar]] %in% c(z1,z0),]
  
  # listwise deletion if obs includes missing data
  sub <- sub[apply(sub[,names(sub) %in% c(Yvar,covs0,covs1)],1,function(x) sum(is.na(x))==0),]
  
  # define regression models by arm
  model0 <- paste(Yvar, "~", paste(covs0, collapse=" + "))
  model1 <- paste(Yvar, "~", paste(covs1, collapse=" + "))
  
  # fit models by arm (this will undo shrinkage from lasso)
  sub$ipw.2g <- sub[[ipwvar]]
  fit0 <- lm(formula=model0, data=sub[sub[[zvar]]==z0,], weights=ipw.2g)
  fit1 <- lm(formula=model1, data=sub[sub[[zvar]]==z1,], weights=ipw.2g)
  
  # predict values using actual data, use data across both treatment arms
  predY0 <- predict(fit0, newdata=sub, se.fit=TRUE, type="response")
  predY1 <- predict(fit1, newdata=sub, se.fit=TRUE, type="response")
  
  # grab vector of predicted values
  predY0.i <- predY0$fit
  predY1.i <- predY1$fit
  
  # calculate mean predicted response (regression adjusted) by arm
  mean.predY0 <- mean(predY0.i)
  mean.predY1 <- mean(predY1.i)
  
  # calculate covariate adjusted estimate of the ATE
  b.hat <- mean.predY1 - mean.predY0
  
  # calculate terms needed to construct the empirical sandwich variance estimate
  
  n0 <- nrow(sub[sub[[zvar]]==z0,]) # number of obs in control
  n1 <- nrow(sub[sub[[zvar]]==z1,]) # number of obs in treatment
  
  n.tot <- n1 + n0 # total number of observations
  
  z.i <- ifelse(sub[[zvar]]==z1, 1, 0) # vector of treatment assignments, recoded 0 and 1
  pi.i <- sub[[ptvar]] # vector of treatment assignment probabilities, by unit
  y.i <- sub[[Yvar]] # vector of observed outcomes
  
  meanY0 <- mean(sub[[Yvar]][sub[[zvar]]==z0], na.rm=TRUE) # mean observed Y0  
  meanY1 <- mean(sub[[Yvar]][sub[[zvar]]==z1], na.rm=TRUE) # mean observed Y1
  
  # take the first derivative of q*_{k,xi}(X, xi*_k) with respect to the vector xi*_k
  # which is just the sum of the X_i's (for variables w/ nonzero coefs from the lasso) by unit  
  q0xi.star <- apply(as.matrix(sub[,names(sub)%in%covs0]),MARGIN=1,function(x) sum(x,na.rm=TRUE))
  q1xi.star <- apply(as.matrix(sub[,names(sub)%in%covs1]),MARGIN=1,function(x) sum(x,na.rm=TRUE))
  
  # code up D.hats, W.hats, phi.hats
  
  D0.hat <- (1/n.tot) * sum(  (z.i - pi.i) * t(q0xi.star) )
  D1.hat <- (1/n.tot) * sum(  (z.i - pi.i) * t(q1xi.star) )
  
  W0.hat <- (1/n.tot) * sum( (1-z.i) * q0xi.star * t(q0xi.star) )
  W1.hat <- (1/n.tot) * sum( (1-z.i) * q1xi.star * t(q1xi.star) )
  
  phi0.hat.i <- z.i * (y.i - predY0.i) * q0xi.star
  phi1.hat.i <- z.i * (y.i - predY1.i) * q1xi.star
  
  # code up empirical sandwich variance estimator (eq 13)
  
  var.es <- sum((((1/n1)*z.i - (1/n0)*(1-z.i))*y.i - (1/n.tot)*b.hat - 
                   (z.i - pi.i)*((1/n0)*predY0.i + (1/n1)*predY1.i) -
                   (z.i - pi.i)*((1/n0)*(meanY1-mean.predY1) + (1/n1)*(meanY0-mean.predY0)) +
                   ( (1/n1)*D1.hat*(1/W1.hat)*phi1.hat.i + (1/n0)*D0.hat*(1/W0.hat)*phi0.hat.i ))^2)
  
  # return covariate adjusted ATE and empirical sandwich variance estimates and SE estimate
  out <- list(est=b.hat, esv=var.es, se=sqrt(var.es))
  return(out)
}


# extract p value from F test for lm
lmp <- function (modelobject) {
  if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
  f <- summary(modelobject)$fstatistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) <- NULL
  return(p)
}

# function to create balance tables


balanceTables <- function(d, z, xcon, xcat, weight=NULL){
  
  require(Hmisc) # needed for weighted variance calculation
  
  if(is.null(weight)){    # IF UNWEIGHTED MEANS AND PROPORTIONS
    
    # for all continuous predictors, output means and sds
    xcon_out <- list()
    for(i in 1:length(xcon)){
      out_means = round(unlist(as.list(by(d, d[,z], function(x) mean(x[,xcon[i]], na.rm=TRUE)))), 3)
      out_sds = paste0("(",round(unlist(as.list(by(d, d[,z], function(x) sd(x[,xcon[i]], na.rm=TRUE)))), 3),")")
      out_sub = cbind(c(xcon[i], NA), rbind(out_means, out_sds))
      rownames(out_sub) = NULL
      xcon_out[[i]] = rbind(out_sub, rep(NA, ncol(out_sub)))
    }
    xcon_out = do.call(rbind, xcon_out)
    xcon_out = as.data.frame(xcon_out, stringsAsFactors=FALSE)
    names(xcon_out) = c("Variable", paste0("Z=", names(xcon_out)[2:ncol(xcon_out)]))
    
    # for all categorical variables, output proportion in each level and sds
    xcat_out <- list()
    for(i in 1:length(xcat)){
      
      temp_out = as.list(by(d, d[,z], function(x) {
        counts = table(x[,xcat[i]])
        props = table(x[,xcat[i]])/nrow(x)
        cat_names = names(table(x[,xcat[i]]))
        ses = round(sqrt(props * (1 - props) / nrow(x)), 3)
        props = round(props, 3)
        
        return(cbind(cat_names, props, ses, counts))
      }))
      
      for(j in 1:length(temp_out)){
        colnames(temp_out[[j]]) = paste0(colnames(temp_out[[j]]), ".z", names(temp_out)[j])
      }
      
      xcat_out[[i]] = do.call(cbind, temp_out)
    }
    
    for(i in 1:length(xcat_out)){
      xcat_out[[i]] <- rbind(c(xcat[i], rep(NA, ncol(xcat_out[[i]])-1)),
                             xcat_out[[i]])
    }
    
    dropif = paste0("cat_names.z", names(table(d[,z])) )
    dropif = dropif[dropif != "cat_names.z0"]
    
    xcat_out = do.call(rbind, xcat_out)
    rownames(xcat_out) = NULL
    
    xcat_out = as.data.frame(xcat_out, stringsAsFactors=FALSE)
    xcat_out = xcat_out[,!(names(xcat_out) %in% dropif)]
    names(xcat_out)[1] = "Variable"
    
    names(xcat_out) = gsub("props", "Pct", names(xcat_out), fixed=TRUE)
    names(xcat_out) = gsub("ses", "SE", names(xcat_out), fixed=TRUE)
    names(xcat_out) = gsub("counts", "N", names(xcat_out), fixed=TRUE)
    
  } else {    # IF WEIGHTED MEANS AND PROPORTIONS
    
    # for all continuous predictors, output means and sds
    xcon_out <- list()
    for(i in 1:length(xcon)){
      out_means = round(unlist(as.list(by(d, d[,z], function(x) weighted.mean(x[,xcon[i]], x[,weight], na.rm=TRUE)))), 3)
      out_sds = paste0("(",round(unlist(as.list(by(d, d[,z], function(x) sqrt(wtd.var(x[,xcon[i]], x[,weight], na.rm=TRUE)) ))), 3),")")
      out_sub = cbind(c(xcon[i], NA), rbind(out_means, out_sds))
      rownames(out_sub) = NULL
      xcon_out[[i]] = rbind(out_sub, rep(NA, ncol(out_sub)))
    }
    xcon_out = do.call(rbind, xcon_out)
    xcon_out = as.data.frame(xcon_out, stringsAsFactors=FALSE)
    names(xcon_out) = c("Variable", paste0("Z=", names(xcon_out)[2:ncol(xcon_out)]))
    
    # for all categorical variables, output proportion in each level and sds
    xcat_out <- list()
    for(i in 1:length(xcat)){ # for each variable
      
      cat_vals = names(table(d[,xcat[i]]))
      z_vals = names(table(d[,z]))

      wt_p_numer_out = wt_p_denom_out = wt_p_out = wt_p_se_out = matrix(NA, nrow=length(cat_vals), ncol=length(z_vals))
      
      for(j in 1:length(z_vals)){
        for(k in 1:length(cat_vals)){
          wt_p_numer = sum(d[d[,z] == z_vals[j] & d[,xcat[i]]==cat_vals[k], weight], na.rm=TRUE)
          wt_p_denom = sum(d[d[,z] == z_vals[j] ,weight], na.rm=TRUE) 
          
          wt_p = wt_p_numer / wt_p_denom
          wt_p_se = sqrt(wt_p * (1 - wt_p) / nrow( d[d[,z]==z_vals[j],] ))
          
          wt_p_numer_out[k,j] = wt_p_numer
          wt_p_denom_out[k,j] = wt_p_denom
          wt_p_out[k,j] = wt_p
          wt_p_se_out[k,j] = wt_p_se
          
        }
      }
      
      tab_out = NULL
      for(j in 1:ncol(wt_p_out)){
        tab_out = cbind(tab_out, round( wt_p_out[,j], 3), round(wt_p_se_out[,j], 3), round(wt_p_numer_out[,j], 3))
      }
      tab_out = cbind(cat_vals, tab_out)
      
      colnames(tab_out) = c("Variable", paste0(rep(c("Pct", "SE", "Wtd N"), length(z_vals)), ".z", rep(z_vals, each=3)))
      tab_out = rbind(c(xcat[i], rep(NA, ncol(tab_out)-1)),
                      tab_out)
      
      xcat_out[[i]] = tab_out
    }
    
    xcat_out = do.call(rbind, xcat_out)
    rownames(xcat_out) = NULL
    xcat_out = as.data.frame(xcat_out, stringsAsFactors=FALSE)
    
  }
  
  # Combine output balance labels in single list to return
  out = list(bt_con = xcon_out,
             bt_cat = xcat_out)
  return(out)
}

