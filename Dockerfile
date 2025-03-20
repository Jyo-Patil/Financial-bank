# Stage 1: Build the React frontend 
FROM node:18-alpine AS frontend-build 
WORKDIR /app/frontend 
COPY frontend/package*.json ./ 
RUN npm install COPY frontend/. ./ 
RUN npm run build 

# Stage 2: Build the Node.js backend 
FROM node:18-alpine AS backend-build 
WORKDIR /app/backend 
COPY backend/package*.json ./ 
RUN npm install COPY backend/. ./ 

# Stage 3: Final image with both frontend and backend 
FROM node:18-alpine 
WORKDIR /app 

# Copy built frontend from the frontend-build stage 
COPY --from=frontend-build /app/frontend/build ./frontend/build 

# Copy backend from the backend-build stage 
COPY --from=backend-build /app/backend/. ./backend 

# Install serve for the frontend 
RUN npm install -g serve 

# Expose backend port 
EXPOSE 4001 

# Set environment variables for AWS credentials 

COPY .env ./backend/.env ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ENV AWS_REGION=${AWS_REGION} 

# Start the backend and frontend 
CMD ["sh", "-c", "cd backend && node server.mjs & cd ../frontend && serve -s build -l 3000"]