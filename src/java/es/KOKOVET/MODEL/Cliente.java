
package es.KOKOVET.MODEL;

public class Cliente {
    int id;
    String dni;
    String Nombres;
    String Apellidos;
    String Direccion;
    String Email;
    String Pass;
    String Telefono;
    String Distrito;
    int Rol;
    int Estado;
    
    public Cliente() {
    }

    public Cliente(int id, String dni, String Nombres, String Apellidos, String direccion, String email, String pass, String Telefono, String Distrito, int Rol, int Estado) {
        this.id = id;
        this.dni = dni;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.Direccion = direccion;
        this.Email = email;
        this.Pass = pass;
        this.Telefono = Telefono;
        this.Distrito = Distrito;
        this.Rol = Rol;
        this.Estado = Estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String direccion) {
        this.Direccion = direccion;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String pass) {
        this.Pass = pass;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getDistrito() {
        return Distrito;
    }

    public void setDistrito(String Distrito) {
        this.Distrito = Distrito;
    }

    public int getRol() {
        return Rol;
    }

    public void setRol(int Rol) {
        this.Rol = Rol;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }


    
}
