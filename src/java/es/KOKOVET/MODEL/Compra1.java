
package es.KOKOVET.MODEL;

public class Compra1 {
    int id;
    String fecha;
    Double monto;
    int idPago;
    String estado;
    Cliente Cliente;

    public Compra1() {
    }

    public Compra1(int id, String fecha, Double monto, int idPago, String estado, Cliente Cliente) {
        this.id = id;
        this.fecha = fecha;
        this.monto = monto;
        this.idPago = idPago;
        this.estado = estado;
        this.Cliente = Cliente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Cliente getCliente() {
        return Cliente;
    }

    public void setCliente(Cliente Cliente) {
        this.Cliente = Cliente;
    }
    
    


}
