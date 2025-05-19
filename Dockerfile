FROM node:20

# Install elm-live for hot reloading
RUN npm install -g elm-live@next

# Install Elm using the unofficial @lydell/elm package
RUN npm install -g @lydell/elm

WORKDIR /app
EXPOSE 8000

CMD ["elm-live", "src/Main.elm", "--hot", "--open", "--host=0.0.0.0", "--", "--output=elm.js"]
