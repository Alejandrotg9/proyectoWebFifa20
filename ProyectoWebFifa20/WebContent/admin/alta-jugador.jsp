<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="fifa20.*" %>
<%@ page import="java.util.*" %>

<%
	BDController controladorBD = new BDController();
	ArrayList<Equipo> equipos=controladorBD.dameEquipos();
%>
<jsp:include page="../includes/header.jsp"></jsp:include>

				<section class="wrapper style1" style="height:500px;">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									
									<section class="col-6 col-12-narrower">
								<h3>Alta Jugador</h3>
								<form action="" method="post">
									<div class="row gtr-50">
										<div class="">
											<input type="text" name="" id="" placeholder="" style="width:450px"; maxlength="20"/>
										</div>
										<div class="">
											<input type="text" name="" id="" placeholder="" maxlength="9"/>
										</div>
										<div class="">
											<input type="number" name="" id="" placeholder="" maxlength="3"/>
										</div>
										<div class="">
											<input type="text" name="" id="" placeholder="" maxlength="20"/>
										</div>
										<div class="">
											<input type="number" name="" id="" placeholder="" maxlength="4"/>
										</div>
												
									</div>
									
									<div style="padding-top:22px;">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="" /></li>
											</ul>
									</div>
									
								</form>
							</section>
								</article>
						</div>
					</div>
				</section>
<jsp:include page="../includes/footer.jsp"></jsp:include>