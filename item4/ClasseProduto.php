<?php

class Produto
{

    private $nome;

    private $valorCompra;

    private $valorVenda;

    private $quantidade;

    public function getNome()
    {
        return $this->nome;
    }

    public function getValorCompra()
    {
        return $this->valorCompra;
    }

    public function getValorVenda()
    {
        return $this->valorVenda;
    }

    public function getQuantidade()
    {
        return $this->quantidade;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setValorCompra($valorCompra)
    {
        $this->valorCompra = $valorCompra;
    }

    public function setValorVenda($valorVenda)
    {
        $this->valorVenda = $valorVenda;
    }

    public function setQuantidade($quantidade)
    {
        $this->quantidade = $quantidade;
    }

    public function calcularValorEstoque($valorCompra, $quantidade): float
    {
        $this->valorCompra = $valorCompra;
        $this->quantidade = $quantidade;
        $valorEstoque = $valorCompra * $quantidade;
        return $valorEstoque;
    }

    public function calcularValorTotalVenda($valorVenda, $quantidade): float
    {   
        $this->valorVenda = $valorVenda;
        $this->quantidade = $quantidade;
        $valorTotvenda = $valorVenda * $quantidade;
        return $valorTotvenda;
    }

    public function calcularLucroBruto(): float{
        
        
       $valorEstoque = $this->calcularValorEstoque($this->valorCompra , $this->quantidade);
       var_dump($valorEstoque);
       
       $valorTotVenda = $this->calcularValorTotalVenda($this->valorVenda , $this->quantidade); 
       var_dump($valorTotVenda);
       
       $total = $valorEstoque - $valorTotVenda;
       var_dump($total);
       
       return $total;
    }
}    

$produto = new Produto();
echo "Calcula Valor Estoque: ".$produto->calcularValorEstoque(300,10);
echo "\nCalcula Valor Total Venda: ".$produto->calcularValorEstoque(100,30);
echo "\nCalcular Lucro Bruto: ".$produto->calcularLucroBruto();