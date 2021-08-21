import {
  MetrixRPC_RawTx,
  MetrixRPC_SignRawTx,
  MetrixRPCNode,
} from "../lib/MetrixRPC/MetrixRPC";

import fs from "fs";
import path from "path";
const dataDirectory = path.join(__dirname, "..", "..", "data");
const contractFile = path.join(dataDirectory, "contract.json");
console.log(`dataDirectory: ${dataDirectory}`);
console.log(`contractFile: ${contractFile}`);
interface Contract {
  abi: any;
  bytecode: string;
}

class MetrixContractDeployer {
  private mrpc: MetrixRPCNode;
  private contract: Contract;
  constructor() {
    this.mrpc = new MetrixRPCNode(
      process.env.DEPLOYMENT_ACCT ? process.env.DEPLOYMENT_ACCT : null,
      process.env.RPC_URL as string,
      process.env.RPC_USER as string,
      process.env.RPC_PASS as string
    );
    if (!fs.existsSync(dataDirectory)) {
      fs.mkdirSync(dataDirectory);
    }
    if (!fs.existsSync(contractFile)) {
      console.log("Failed to load contracts. Check data");
      process.exit(1);
    }
    this.contract = JSON.parse(fs.readFileSync(contractFile).toString());
  }

  public async deploy() {
    const test = await this.mrpc.promiseCreateContract(
      this.contract.bytecode,
      process.env.GAS_LIMIT,
      process.env.GAS_PRICE,
      process.env.DEPLOYMENT_ACCT as string
    );
    console.log(JSON.stringify(test));
  }
}

export { MetrixContractDeployer, Contract };
