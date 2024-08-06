import { Client, AccountBalanceQuery } from '@hashgraph/sdk';
import dotenv from "dotenv";
dotenv.config();
// Asegúrate de que las variables de entorno estén definidas correctamente
const accountId =process.env.HEDERA_ACCOUNT_ID!;
const privateKey = process.env.HEDERA_PRIVATE_KEY!;


async function main() {
    //Creamos un cliente para la testnet
    const client = Client.forTestnet()
    //configuramos el operador del cliente
    client.setOperator(accountId, privateKey);

    // Verificar la configuración
    const balance = await new AccountBalanceQuery()
        .setAccountId(accountId)
        .execute(client);

    console.log(`Saldo de la cuenta ${accountId}: ${balance.hbars} HBAR`);

    // Aquí iría la lógica de despliegue del contrato
}

main().catch((error) => {
    console.error("Error en el despliegue:", error);
    process.exitCode = 1;
});
