version: 2.1

executors:
  node-dapp:
    docker:
      - image: cimg/node:20.3.0
    working_directory: ~/casabeci

jobs:
  deploy-casabeci:
    executor: node-dapp
    steps:
      - checkout
      - run:
          name: Install dependencies
          command: npm install
      - run:
          name: Compile Smart Contract
          command: npx hardhat compile
      - run:
          name: Deploy to Polygon
          command: |
            echo "Deploying to Polygon..."
            npx hardhat run scripts/deploy.js --network polygon

workflows:
  casabeci_deployment:
    jobs:
      - deploy-casabeci
