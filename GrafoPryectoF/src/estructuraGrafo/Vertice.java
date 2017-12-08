/* Manuel Prada / Alexander correa 



 */
package estructuraGrafo;

/**
 *
 * @author Manuel Prada / Alexander correa 
 */
public class Vertice {

    private int mCoeficiente[][] = new int[51][51];
    private int mAdyacencia[][] = new int[51][51];
    private int cordeX[] = new int[51];
    private int cordeY[] = new int[51];
    private int nombre[] = new int[51];
    private String ip[] = new String[51];
    private String nombreCiudad[] = new String[51];
    private int enArbol[];

    public Vertice() {

    }

    public int getmCoeficiente(int i, int j) {
        return mCoeficiente[i][j];
    }

    public int getmAdyacencia(int i, int j) {
        return mAdyacencia[i][j];
    }

    public int getCordeX(int i) {
        return cordeX[i];
    }

    public int getCordeY(int i) {
        return cordeY[i];
    }

    public int getNombre(int i) {
        return nombre[i];
    }

    public int getEnArbol(int i) {
        return enArbol[i];
    }

    public void setmCoeficiente(int i, int j, int mCoeficiente) {
        this.mCoeficiente[i][j] = mCoeficiente;
    }

    public void setmAdyacencia(int i, int j, int mAdyacencia) {
        this.mAdyacencia[i][j] = mAdyacencia;
    }

    public void setCordeX(int i, int cordeX) {
        this.cordeX[i] = cordeX;
    }

    public void setCordeY(int i, int cordeY) {
        this.cordeY[i] = cordeY;
    }

    public void setNombre(int i, int nombre) {
        this.nombre[i] = nombre;
    }

    public void setEnArbol(int i, int enArbol) {
        this.enArbol[i] = enArbol;
    }

    public void crearEnArbol(int i) {
        enArbol = new int[i];
    }

    public String getIp(int i) {
        return ip[i];
    }

    public void setIp(int i, String ip) {
        System.out.println("identificador = " + i + "Direccion= " + ip);
        this.ip[i] = ip;
    }

    public String getNombreCiudad(int i) {
        return nombreCiudad[i];
    }

    public void setNombreCiudad(int i, String nombreEquipo) {
        this.nombreCiudad[i] = nombreEquipo;
    }

}
