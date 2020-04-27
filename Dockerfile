FROM broadinstitute/gatk:4.1.3.0

LABEL bwa.version="0.7.17"
LABEL gatk.version="4.1.3.0"

RUN conda install -c bioconda -y bwa seqtk
RUN pip install --upgrade awscli
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER nobody

ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]
