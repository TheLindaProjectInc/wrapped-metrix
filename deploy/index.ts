import dotenv from "dotenv";
import { MetrixContractDeployer } from "./app/MetrixContractDeployer";

dotenv.config();
const deployer = new MetrixContractDeployer();
