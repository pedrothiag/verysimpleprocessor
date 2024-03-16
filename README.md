# Um Processador Muito Simples (A Very Simple Processor - AVSP) em Verilog

Esse processador foi desenvolvido por mim quando ministrei a disciplina de Sistemas Digitais. Embora bastante simples, esse processador contém muitos conceitos interessantes sobre Arquitetura e Organização de Computadores. O processador possui as seguintes características:
1. O acesso a memória segue o modelo proposto por Harvard;
2. O microcontrolador opera com dados de 8-bits;
3. As instruções que serão executadas pelo microcontrolador são de 13-bits;
4. As memórias de dados e de instruções possui, ambas, 256 posições.
5. Possui apenas um registrador interno de propósito geral, denominado de acumulador (acc) que armazena os dados: (i) resultantes das operações da ALU; (ii) de carregamentos imediatos; (iii) de valores armazenados na memória de dados e (iv) valores disponível em um pino externo, denominado de datain, de
8-bits;
6. O valor armazenado no registrador acumulador (acc) poderá ser salvo: (i) na memória de dados ou (ii) para um registrador rout, de 8-bits, que corresponde aos pinos de saída do microcontrolador;
7. O Microcontrolador deve permitir apenas uma chamada de sub-rotina em cascata.

## Arquitetura do Conjunto de Instruções

O processador possui 26 instruções. Em todas as instruções, a campo de Opcode possui 5 bits. O formato das instruções em baixo nível é apresentado abaixo:

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/64a3ce38-4c4c-4b1a-bcb1-e547778caa20)

### Instruções Lógicas e Aritméticas

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/cdcc578f-350a-4960-83f8-eda82c133308)

Nessas instruções, os bits 7-0 indicam um endereço de Memória de Dados.

### Instruções Lógicas e Aritméticas com Dado Imediato

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/0cd55f89-db43-4e85-a1b0-b08e75531a3e)

Nessas instruções, os bits 7-0 indicam um dado imediato.

### Instruções de Carga e Armazenamento

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/a620e1be-5591-47c5-ac32-c67ac74a4018)

Nessas instruções, os bits 7-0 indicam um dado imediato (instrução LDI) ou um endereço de memória de dados (instruções LDA e STA).

### Instruções de Desvio

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/d7b5febb-f36c-4e24-9824-43044e949b32)

Nessas instruções, os bits 7-0 indicam um endereço de memória de programa (instrução GOTO) ou não são utilizados (instruções SKIFZ, SKIFN e SKIFC).

### Instruções de Chamadas de Rotina

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/f416264c-e068-489d-8dd8-8d157ec7b21f)

Nessas instruções, os bits 7-0 indicam um endereço de memória de programa (instrução CALL) ou não são utilizados (instrução RET).

### Instruções de Entrada e Saída

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/17c5e0ed-b774-4bef-aab4-f8cf0faf1816)

Nessas instruções, os bits 7-0 não são utilizados.

### Instruções de Controle de Operação

![image](https://github.com/pedrothiag/verysimpleprocessor/assets/5923790/23f07a9b-cab1-46bb-9577-e5f24fef48c6)

Nessas instruções, os bits 7-0 não são utilizados.

### Legenda
* acc: Registrador acc;
* Mem: Memória de Dados;
* PC: Contador de Programa;
* STACK: Pilha de Sistema;
* adr: Endereço de memória de dados;
* imed: Dado imediato;
* pcadr: Endereço de memória de instruções;
* rout: Registrador rout;

## Simulação

O arquivo vsprocessor_tb.v contém um testbench para simulação do processador. O código de máquina é descrito diretamente no arquivo memrom.v. Coloquei três exemplos para testar o funcionamento do processador:
* pell.asm - Calcula a parte inteira da raiz quadrada utilizando o algoritmo de Pell;
* fibo.asm - Gera a sequência de Fibonnaci;
* divo.asm - Realiza divisão inteira entre dois números inteiros.

## Plataforma de Prototipação e Ambiente de Desenvolvimento

Para desenvolver esse processador utilizei o ambiente de desenvolvimento Xilinx ISE 14.7 e para simular utilizei o Modelsim SE-64 10.6d. A placa que utilizarei será a Mimas V2, da NumatoLab, que tem uma FPGA Spartan6. Ainda não tive tempo de implementar o projeto na FPGA, porém será a próxima etapa. Creio que você conseguirá colocar esse projeto em outras FPGAs com algumas alterações simples.




