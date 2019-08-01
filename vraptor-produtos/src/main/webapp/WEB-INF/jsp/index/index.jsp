<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<br>
	<c:if test= "${usuarioLogado.id != 0}">
    <a> <b>${usuarioLogado.usuario.nome}</b>, bem vindo ao sistema de gerenciamento e controle de produtos, SGCP! </a>
    </c:if>
    <c:if test= "${usuarioLogado.id == 0}">
    <a>Bem vindo ao sistema de gerenciamento e controle de produtos, SGCP!</a>
    </c:if>
<br>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>