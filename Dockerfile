FROM jupyter/datascience-notebook:cfddc5a3163f

LABEL maintainer.name="Aaron Steven White" \
      maintainer.email="aaron.white@rochester.edu" \
      maintainer.website="http://aaronstevenwhite.io" \
      project.name="MegaAttitude" \
      project.website="http://megaattitude.io" \
      subproject.name="MegaVeridicality, MegaNegRaising" \
      subproject.website="http://megaattitude.io/projects/mega-veridicality/, http://megaattitude.io/projects/mega-negraising/" \
      image.website="https://github.com/MegaAttitude/on-believing-and-hoping-whether" \
      image.version="1.0" \
      image.modification_date="2021-01-05"

COPY --chown=1000:100 ./*.ipynb /home/jovyan/work/
COPY --chown=1000:100 ./verb_complementizer_counts.csv /home/jovyan/work/

VOLUME /home/jovyan/work/

RUN mkdir plots

RUN pip install tensorflow==1.4.1

RUN R -e "install.packages(c('tidyverse', 'lme4'), repos='http://cran.us.r-project.org')"
