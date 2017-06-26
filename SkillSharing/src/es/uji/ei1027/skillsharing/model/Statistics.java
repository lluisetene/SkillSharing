package es.uji.ei1027.skillsharing.model;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


public class Statistics {

	private Map<String, List<Offer>> diccOfertas;
	private Map<String, List<Demand>> diccDemandas;
	private List<Collaboration> listaColaboraciones;
	
	
	public void setDatos(List<Offer> ofertas, List<Demand> demandas, List<Collaboration> colaboraciones) {
		diccOfertas = new HashMap<String, List<Offer>>();
		diccDemandas = new HashMap<String, List<Demand>>();
		listaColaboraciones = new LinkedList<>();
		setOfertas(ofertas);
		setDemandas(demandas);
		setColaboraciones(colaboraciones);
	}
	
	
	// -------------- OFERTAS ----------------------- //
	public void setOfertas(List<Offer> listaOfertas) {
		
		for ( int i = 0; i < listaOfertas.size(); i++ )
			setOferta(listaOfertas.get(i));
		
	}
	
	
	public void setOferta(Offer offer) {
		
		String nid = offer.getNid();
		
		if ( !diccOfertas.containsKey(nid) ) { 
			diccOfertas.put(nid, new LinkedList<>());
			diccOfertas.get(nid).add(offer);
		} else {
			boolean noEncontrado = true;
			for ( int i = 0; i < diccOfertas.get(nid).size(); i++ )
				if ( diccOfertas.get(nid).get(i).getIdOffer() == offer.getIdOffer()) {
					noEncontrado = false;
					break;
				}
			if ( noEncontrado )
				diccOfertas.get(nid).add(offer);
		}
			
	}
	
	
	public List<Offer> getOfertasEstudiante(String nid) {
		return diccOfertas.get(nid);
	}
	
	
	public Map<String, List<Offer>> getDiccOfertas() {
		return diccOfertas;
	}
	
	public int getOfertasMes(int mes, String nid) {
		String fecha[];
		int contador = 0;
		
		if ( diccOfertas.containsKey(nid) ) {
			for ( int i = 0; i < diccOfertas.get(nid).size(); i++ ) {
				fecha = diccOfertas.get(nid).get(i).getBeginningDate().toString().split("/");
				if ( Integer.parseInt(fecha[1]) == mes )
					contador++;
				}
		}
		
		return contador;
	}
	
	
	// --------------- DEMANDAS --------------------------- //
	public void setDemandas(List<Demand> listaDemandas) {
		
		for ( int i = 0; i < listaDemandas.size(); i++ )
			setDemanda(listaDemandas.get(i));
		
	}
	
	
	public void setDemanda(Demand demand) {

		String nid = demand.getNid();
		
		if ( !diccDemandas.containsKey(nid) ) {
			diccDemandas.put(nid, new LinkedList<>());
			diccDemandas.get(nid).add(demand);
		} else {
			boolean noEncontrado = true;
			for ( int i = 0; i < diccDemandas.get(nid).size(); i++ )
				if ( diccDemandas.get(nid).get(i).getIdDemand() == demand.getIdDemand()) {
					noEncontrado = false;
					break;
				}
			if ( noEncontrado )
				diccDemandas.get(nid).add(demand);
		}
	}
	
	
	public List<Demand> getDemandasEstudiante(String nid) {
		return diccDemandas.get(nid);
	}
	
	
	public Map<String, List<Demand>> getDiccDemandas() {
		return diccDemandas;
	}
	
	
	public int getDemandasMes(int mes, String nid) {
		String fecha[];
		int contador = 0;
		
		if ( diccDemandas.containsKey(nid) ) {
			for ( int i = 0; i < diccDemandas.get(nid).size(); i++ ) {
				fecha = diccDemandas.get(nid).get(i).getBeginningDate().toString().split("/");
				if ( Integer.parseInt(fecha[1]) == mes )
					contador++;
			}
		}
		
		return contador;
	}
	
	
	
	// ------------------ COLABORACIONES --------------- //
	public void setColaboraciones(List<Collaboration> listaColaboraciones) {
		this.listaColaboraciones = listaColaboraciones;
	}
	
	
	public List<Collaboration> getColaboraciones() {
		return listaColaboraciones;
	}
	
	
	public int getValoracionMedia(String nid) {
		int media = 0;
		int valoraciones = 0;
		int contador = 0;
		
		if ( listaColaboraciones.isEmpty() ) 
			return 0;
		
		if ( diccOfertas.containsKey(nid) ) {
			List<Offer> misOfertas = diccOfertas.get(nid);
			for ( int i = 0; i < listaColaboraciones.size(); i++ )
				for ( int j = 0; j < misOfertas.size(); j++ )
					if ( listaColaboraciones.get(i).getIdOffer() == misOfertas.get(j).getIdOffer()) {
						valoraciones += listaColaboraciones.get(i).getRate();
						contador++;
						break;
					}
		}
		
		if ( diccDemandas.containsKey(nid) ) {
			List<Demand> misDemandas = diccDemandas.get(nid);
			for ( int i = 0; i < listaColaboraciones.size(); i++ )
				for ( int k = 0; k < misDemandas.size(); k++ )
					if ( listaColaboraciones.get(i).getIdDemand() == misDemandas.get(k).getIdDemand()) {
						valoraciones += listaColaboraciones.get(i).getRate();
						contador++;
						break;
					}
		}
			
		if ( contador != 0)
			media = valoraciones/contador;
		
		return media;
	}
	
	
	public List<Collaboration> getColaboracionesEstudiante(String nid) {
		
		List<Collaboration> colaboracionesEstudiante = new LinkedList<>();
	
		if ( diccOfertas.containsKey(nid) )
			for ( int i = 0; i < listaColaboraciones.size(); i++ ) {
				for ( int j = 0; j < diccOfertas.get(nid).size(); j++ )
					if ( listaColaboraciones.get(i).getIdOffer() == diccOfertas.get(nid).get(j).getIdOffer()) {
						colaboracionesEstudiante.add(listaColaboraciones.get(i));
						break;
					}
			}
		
		if ( diccDemandas.containsKey(nid) )
			for ( int i = 0; i < listaColaboraciones.size(); i++ ) {
				for ( int k = 0; k < diccDemandas.get(nid).size(); k++ )
					if ( listaColaboraciones.get(i).getIdDemand() == diccDemandas.get(nid).get(k).getIdDemand()) {
						colaboracionesEstudiante.add(listaColaboraciones.get(i));
						break;
					}
			}
			
		return colaboracionesEstudiante;
		
	}
	
}