docker run -i -t -p 8080:8080 data-env /bin/bash -c "\
    conda install jupyter -y --quiet && \
    mkdir -p /opt/notebooks && \
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8080 \
    --no-browser --allow-root"
