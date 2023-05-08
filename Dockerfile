# ---- Production ----
FROM node:18-alpine AS production
WORKDIR /dist

COPY package*.json ./

# use npm ci for production
RUN npm install --omit=dev
# Copy the rest of the application code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Build the application for production
RUN npm run build

# Start the application
CMD ["yarn", "start"]
