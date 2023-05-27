FROM python:3.10

RUN pip install --upgrade pip setuptools wheel
# RUN pip install prophet --global http.sslVerify false;
RUN pip install yapf

RUN pip install jupyterlab
RUN pip install jupyter_contrib_nbextensions 
# RUN pip install jupyterthemes 

RUN jupyter contrib nbextension install --user

ADD requirements.txt .

RUN ls -lha ; pwd ; pip install -r requirements.txt

#RUN jt -t onedork -T -N -kl


RUN jupyter nbextension enable scratchpad/main --sys-prefix 
# RUN jupyter nbextension enable zenmode/main --sys-prefix
RUN jupyter nbextension enable varInspector/main --sys-prefix
RUN jupyter nbextension enable code_prettify/code_prettify --sys-prefix
# RUN jupyter nbextension enable livemdpreview/livemdpreview --sys-prefix
RUN jupyter nbextension enable snippets_menu/main --sys-prefix 
RUN jupyter nbextension enable snippets/main --sys-prefix 
RUN jupyter nbextension enable hinterland/hinterland --sys-prefix
# RUN jupyter nbextension enable execute_time/ExecuteTime --sys-prefix

WORKDIR /lab

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0"]

