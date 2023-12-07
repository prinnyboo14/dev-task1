# Use Python 3.6 or later as a base image
FROM python
# Copy contents into image
 COPY requirements.txt
# Install pip dependencies from requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Set YOUR_NAME environment variable
YOUR_NAME = "beth"
# Expose the correct port
EXPOSE 5500
# Create an entrypoint
ENTRYPOINT["python","app.py"]
