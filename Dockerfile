# Stage 1: Build the React frontend 
FROM node:18-alpine AS frontend-build 
WORKDIR ./frontend 
COPY ./frontend/package*.json ./ 
RUN npm install 
COPY ./frontend/. ./ 
RUN npm run build
CMD [ "npm", "start" ]


# # Stage 2: Build the Node.js backend 
# FROM node:18-alpine AS backend-build 
# WORKDIR ./backend 
# COPY ./backend/package*.json ./ 
# RUN npm install 
# COPY ./backend/. ./ 

# # Stage 3: Final image with both frontend and backend 
# FROM node:18-alpine 
# WORKDIR ./

# # Copy built frontend from the frontend-build stage 
# COPY --from=frontend-build ./frontend/build ./frontend/build 

# # Copy backend from the backend-build stage 
# COPY --from=backend-build ./backend/. ./backend 

# # Install serve for the frontend 
# RUN npm install -g serve 

# # Expose backend port 
# EXPOSE 4001 

# # Set environment variables for AWS credentials 
# # Use build arguments for sensitive credentials
# ARG AWS_ACCESS_KEY_ID
# ARG AWS_SECRET_ACCESS_KEY
# ARG AWS_REGION

# # Set environment variables using build arguments
# ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} 
# ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} 
# ENV AWS_REGION=${AWS_REGION}

# # COPY .env ./backend/.env ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ENV AWS_REGION=${AWS_REGION} 

# # Start the backend and frontend 
# CMD ["sh", "-c", "cd backend && node server.mjs & cd ../frontend && serve -s build -l 3000"]