FROM apache/spark:4.1.1-java21-python3

USER root

RUN apt-get update -qq && apt-get install -y -qq unzip

RUN ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/') && \
    wget -O /tmp/duckdb.zip \
        "https://github.com/duckdb/duckdb/releases/download/v1.5.2/duckdb_cli-linux-${ARCH}.zip" && \
    unzip /tmp/duckdb.zip -d /usr/bin/ && \
    chmod +x /usr/bin/duckdb && \
    rm /tmp/duckdb.zip && \
    duckdb -c "INSTALL delta; INSTALL httpfs; INSTALL aws; INSTALL azure; INSTALL unity_catalog;"

RUN pip install --no-cache-dir \
    "delta-spark==4.1.0" \
    "deltalake==1.5.1" \
    "marimo[recommended]>=0.20.1" \
    "nbconvert>=7.17.0" \
    "numpy>=2.2.6" \
    "pandas" \
    "playwright>=1.58.0" \
    "pyarrow==24.0.0" \
    "pyspark==4.1.1"

RUN playwright install --with-deps chromium

WORKDIR /opt/workspace

# setup workspace
RUN ln -sf /opt/scripts
RUN ln -sf /home/unitycatalog/etc/data
COPY marimo-playground/ ./marimo-playground

RUN chmod +x marimo-playground/start.sh

EXPOSE 2718

ENTRYPOINT ["marimo-playground/start.sh"]
