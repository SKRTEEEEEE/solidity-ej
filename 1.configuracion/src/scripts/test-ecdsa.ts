import { Client, PrivateKey, AccountBalanceQuery } from '@hashgraph/sdk';
import dotenv from 'dotenv';
dotenv.config();

const accountId =  process.env.ECDSA_ACCOUNT_ID!;
//Indicar que es un string ECDSA
const ecdsaPrivateKey = PrivateKey.fromStringECDSA(process.env.ECDSA_PRIVATE_KEY!);

async function main() {
    // Crear cliente para testnet y configurar su operador.
    const client = Client.forTestnet()
    client.setOperator(accountId, ecdsaPrivateKey);

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