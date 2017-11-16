FROM python:3

MAINTAINER Chris Marks chrismarksus@gmail.com

ENV HOST=0.0.0.0
ENV PORT=5000

WORKDIR /app

EXPOSE ${PORT}

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

CMD slack-export-viewer --no-browser -I ${HOST} -p ${PORT} -z ${ZIPFILEPATH}
