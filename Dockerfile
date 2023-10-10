# Choose our version of Python
FROM python:3.8.16

# Set up a working directory
WORKDIR /app

# Copy just the requirements into the working directory so it gets cached by itself
COPY . /app

# Install the dependencies from the requirements file
#RUN pip install -r requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the code into the working directory
#COPY ./app /code/app

# Tell uvicorn to start spin up our code, which will be running inside the container now
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
