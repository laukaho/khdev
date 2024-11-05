FROM continuumio/miniconda3

WORKDIR /app
COPY . .

RUN conda env create -f environment.yml

# Activate the environment by default when running a container
RUN echo "conda activate khdev" >> ~/.bashrc

SHELL ["conda", "run", "-n", "khdev", "/bin/bash", "-c"]
RUN pip install .

RUN pip install jupyter \
    && pip install notebook
RUN mkdir -p /opt/notebooks
EXPOSE 8080

# Run Jupyter Notebook with the specified options
# CMD ["jupyter", "notebook", "--NotebookApp.token=''", "--notebook-dir=/opt/notebooks", "--ip=*", "--port=8080", "--no-browser", "--allow-root"]
CMD ["bash", "-c", "source activate khdev && jupyter notebook --NotebookApp.token='' --notebook-dir=/opt/notebooks --ip=* --port=8080 --no-browser --allow-root"]