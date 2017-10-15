# Use builds from launchpad 
FROM opencpu/base 

RUN apt-get install -y wget

# Install R package 
COPY digiter_0.1.0.tar.gz /tmp
RUN wget https://cran.r-project.org/src/contrib/randomForest_4.6-12.tar.gz -P /tmp
RUN R CMD INSTALL /tmp/randomForest_4.6-12.tar.gz --library=/usr/local/lib/R/site-library
RUN R CMD INSTALL /tmp/digiter_0.1.0.tar.gz --library=/usr/local/lib/R/site-library