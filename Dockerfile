FROM python:3.8

WORKDIR /image

COPY requirements.txt /image/

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -ms /bin/bash myuser
USER myuser

COPY Dataset/Questions.csv /image/Datasets/

COPY Dataset/Tags.csv /image/Datasets/

COPY models/ image/models/

COPY Stack-Overflow-Tag-Prediction/ /image/Notebooks/

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]