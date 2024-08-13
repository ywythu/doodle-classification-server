FROM python:3.7

WORKDIR /

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

RUN pip install --upgrade pip
COPY requirements.txt r.txt
RUN pip install -r r.txt
RUN pip install protobuf==3.17.0
COPY . .

EXPOSE 8001

ENTRYPOINT [ "python", "-m", "doodle_classification.server" ]