[![GitHub license](https://img.shields.io/github/license/TheLindaProjectInc/wrapped-metrix)](https://github.com/TheLindaProjectInc/wrapped-metrix/blob/main/LICENSE.md) [![Node.js CI](https://github.com/TheLindaProjectInc/wrapped-metrix/actions/workflows/node.js.yml/badge.svg)](https://github.com/TheLindaProjectInc/wrapped-metrix/actions/workflows/node.js.yml)

# Wrapped Metrix

This repository is a suite of contracts as well as the scripts needed to deploy them.

### Prerequisites

- [NodeJS 14+](https://nodejs.org/en/download/)
- [TypeScript](https://www.typescriptlang.org/#installation)
- [solc](https://docs.soliditylang.org/en/v0.8.7/installing-solidity.html)
- [metrixd](https://github.com/TheLindaProjectInc/Metrix/releases)

### Scripts

- `npm install` - install the project dependencies
- `npm run buildTs` - transpile the typescript project
- `npm run buildSol` - compile the solidity project
- `npm run build` - oneshot script to compile/transpile both the typescript and solidity
- `npm run deploy` - deploy the built contracts to Metrix (need to copy example.env to .env and configure)
- `npm run web` - run a webserver serving static pages from public directory (need to edit public/abi.json and public/debug/index.html)
