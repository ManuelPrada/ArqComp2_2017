/* Manuel Prada / Alexander correa 



 */
package estructuraGrafo;

import static ventanasGraficas.VentanaPrincipal.jPanel1;
import static ventanasGraficas.VentanaPrincipal.R_repaint;
import java.awt.Color;
import javax.swing.JOptionPane;

/**
 *
 * @author Manuel Prada / Alexander correa 
 */
public class Algoritmo_Dijkstra {

    private Vertice arboles;
    private int subTope;
    private Arco aux = null;
    private int auxAumulado; // es un acumulado auxiliar
    private int subAcomulado;
    private Arco vertice[];
    private int tope;
    private int permanente;
    private int verticeFin;

    public Algoritmo_Dijkstra(Vertice arboles, int tope, int permanente, int nodoFin) {// hacemos los llamados para no confundirlos con posteriores variables 
        this.arboles = arboles;
        this.tope = tope;
        this.vertice = new Arco[tope];
        this.permanente = permanente;
        this.verticeFin = nodoFin;

    }

    public int getAcumulado() {
        return vertice[verticeFin].getAcumulado();
    }

    public void dijkstra() {
        for (int i = 0; i < tope; i++) // creamos el vector vertice del tamaño de tope el cual tiene el numero de vertice pintados 
        {
            vertice[i] = new Arco();
        }

        if (permanente != verticeFin) {
            jPanel1.paint(jPanel1.getGraphics());
            R_repaint(tope, arboles);
            Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(permanente), arboles.getCordeY(permanente), null, Color.GREEN); // pinta de color GREEN los vertices

            vertice[permanente].setVisitado(true);
            vertice[permanente].setNombre(permanente);

            do {
                subAcomulado = 0;
                auxAumulado = 2000000000; // lo igualamos a esta cifra ya que el acomulado de los vertices, supuestamente  nunca sera mayor 
                vertice[permanente].setEtiqueta(true);
                for (int j = 0; j < tope; j++) {
                    if (arboles.getmAdyacencia(j, permanente) == 1) {
                        subAcomulado = vertice[permanente].getAcumulado() + arboles.getmCoeficiente(j, permanente);
                        if (subAcomulado <= vertice[j].getAcumulado() && vertice[j].isVisitado() == true && vertice[j].isEtiqueta() == false) {
                            vertice[j].setAcumulado(subAcomulado);
                            vertice[j].setVisitado(true);
                            vertice[j].setNombre(j);
                            vertice[j].setPredecesor(vertice[permanente]);
                        } else if (vertice[j].isVisitado() == false) {
                            vertice[j].setAcumulado(subAcomulado);
                            vertice[j].setVisitado(true);
                            vertice[j].setNombre(j);
                            vertice[j].setPredecesor(vertice[permanente]);
                        }
                    }
                }
                for (int i = 0; i < tope; i++) { // buscamos cual de los nodos visitado tiene el acomulado menor par escogerlo como permanente 
                    if (vertice[i].isVisitado() == true && vertice[i].isEtiqueta() == false) {
                        if (vertice[i].getAcumulado() <= auxAumulado) {
                            permanente = vertice[i].getNombre();
                            auxAumulado = vertice[i].getAcumulado();
                        }
                    }
                }
                subTope++;
            } while (subTope < tope + 1);
            aux = vertice[verticeFin];
            if (aux.getPredecesor() == null) {
                JOptionPane.showMessageDialog(null, "No se Pudo LLegar Al vertice " + verticeFin);
            }
            while (aux.getPredecesor() != null) {
                Pintar.pintarCamino(jPanel1.getGraphics(), arboles.getCordeX(aux.getNombre()), arboles.getCordeY(aux.getNombre()), arboles.getCordeX(aux.getPredecesor().getNombre()), arboles.getCordeY(aux.getPredecesor().getNombre()), Color.GREEN);
                Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(aux.getNombre()), arboles.getCordeY(aux.getNombre()), null, Color.GREEN);
                aux = aux.getPredecesor();
            }
            Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(verticeFin), arboles.getCordeY(verticeFin), null, Color.GREEN);
        } else {
            Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(verticeFin), arboles.getCordeY(verticeFin), null, Color.GREEN);
        }
    }

}
