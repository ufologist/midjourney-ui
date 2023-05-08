# ---- Production ----
FROM node:18-alpine AS production
WORKDIR /dist

COPY package*.json ./

# use npm ci for production
RUN npm install --omit=dev
RUN npm run build
# Copy the rest of the application code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
