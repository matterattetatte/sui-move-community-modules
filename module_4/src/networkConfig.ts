import { getFullnodeUrl } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    devnet: {
      url: getFullnodeUrl("devnet"),
      variables: {
        packageId: "0xc3f4000d02137040e8548e4585ec45e94ae6462df162da2ad5ced2541d5981c2", // TODO: Get package ID from instructor
      },
    },
    testnet: {
      url: getFullnodeUrl("testnet"),
      variables: {
        packageId: "0xc3f4000d02137040e8548e4585ec45e94ae6462df162da2ad5ced2541d5981c2", // TODO: Get package ID from instructor
      },
    },
    mainnet: {
      url: getFullnodeUrl("mainnet"),
      variables: {
        packageId: "0xc3f4000d02137040e8548e4585ec45e94ae6462df162da2ad5ced2541d5981c2", // TODO: Get package ID from instructor
      },
    },
  });

export { useNetworkVariable, useNetworkVariables, networkConfig };
