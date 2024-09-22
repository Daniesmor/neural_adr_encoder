FROM python:3.9
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install torch==2.0.1+cu118 --index-url https://download.pytorch.org/whl/cu118
RUN pip install torchvision==0.15.2+cu118 --index-url https://download.pytorch.org/whl/cu118
RUN pip install torchaudio==2.0.1+cu118 --index-url https://download.pytorch.org/whl/cu118
COPY . .
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

