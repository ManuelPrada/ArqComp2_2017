/* Manuel Prada / Alexander correa 



 */
package estructuraGrafo;

/**
 *
 * @author Manuel Prada / Alexander correa 
 */
public class Arco {

    private int nombre;
    private boolean visitado;
    private boolean etiqueta;
    private int acumulado; // lleva el acomulado de cada vertice
    private Arco Predecesor;

    public Arco() {
        this.nombre = -1;
        this.visitado = false;
        this.etiqueta = false;
        this.Predecesor = null;
        this.acumulado = 0;

    }

    public int getNombre() {
        return nombre;
    }

    public boolean isVisitado() {
        return visitado;
    }

    public boolean isEtiqueta() {
        return etiqueta;
    }

    public int getAcumulado() {
        return acumulado;
    }

    public Arco getPredecesor() {
        return Predecesor;
    }

    public void setNombre(int nombre) {
        this.nombre = nombre;
    }

    public void setVisitado(boolean visitado) {
        this.visitado = visitado;
    }

    public void setEtiqueta(boolean etiqueta) {
        this.etiqueta = etiqueta;
    }

    public void setAcumulado(int acomulado) {
        this.acumulado = acomulado;
    }

    public void setPredecesor(Arco Predecesor) {
        this.Predecesor = Predecesor;
    }

}
