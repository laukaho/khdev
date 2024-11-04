# Use the official Python image as the base
FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Copy the environment.yml file into the container
COPY environment.yml .

# Install dependencies and create the environment from the environment.yml file
RUN conda env create -f environment.yml

# Activate the environment by default when running a container
RUN echo "conda activate data-env" >> ~/.bashrc

# Ensure conda environment is activated and python is linked to the environment
SHELL ["conda", "run", "-n", "data-env", "/bin/bash", "-c"]

# Copy the application code (if any) into the container
COPY . .

# Specify the default command to activate the environment and run a script (e.g., main.py)
CMD ["conda", "run", "-n", "data-env", "python", "main.py"]
