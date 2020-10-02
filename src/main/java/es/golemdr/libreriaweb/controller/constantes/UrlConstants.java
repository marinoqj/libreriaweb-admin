package es.golemdr.libreriaweb.controller.constantes;


public class UrlConstants {

	public static final String SUFIJO_PAGINACION = 	"{inicio}.do";
	public static final String URL_LOGIN = "/login.do";
	public static final String URL_DENIED = "/denied.do";
	public static final String URL_LOGIN_SUCCESS = "/loginSuccess.do";
	public static final String URL_LOGIN_FAILURE = "/login-failure.do";	
	public static final String URL_HOME = "/home.do";

	
	
	public static final String URL_LISTADO_CLIENTES = "/listadoClientes" + SUFIJO_PAGINACION;
	public static final String URL_BUSCAR_CLIENTES = "/buscarClientes.do";
	
	public static final String URL_LISTADO_PEDIDOS_CLIENTE = "/listadoPedidosCliente.do";
	
	public static final String URL_LISTADO_PEDIDOS = "/listadoPedidos" + SUFIJO_PAGINACION;
	public static final String URL_VER_DETALLE_PEDIDO = "/detallePedido.do";
	
	
	// Productos
	public static final String URL_LISTADO_PRODUCTOS = "/listadoProductos" + SUFIJO_PAGINACION;	
	public static final String URL_LISTADO_PRODUCTOS_FILTRADO = "/listadoProductosFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_PRODUCTO = "/altaProducto.do";
	public static final String URL_INSERTAR_PRODUCTO = "/insertarProducto.do";
	public static final String URL_EDITAR_PRODUCTO = "/editarProducto.do";
	public static final String URL_ACTUALIZAR_PRODUCTO = "/actualizarProducto.do";
	public static final String URL_BORRAR_PRODUCTO = "/borrarProducto.do";	

	
}