<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>

    <main>
        <section class="about-hero">
            <div class="container">
                <h1>Our Story</h1>
                <div class="decorative-line"></div>
            </div>
        </section>

        <section class="about-content">
            <div class="container">
                <div class="about-description">
                    <p>We are a team of passionate and collaborative web development enthusiasts working together to create innovative, user-friendly, and responsive websites. Our project combines front-end and back-end technologies to deliver a seamless user experience, reflecting our commitment to clean code, modern design principles, and practical functionality. Through teamwork and continuous learning, we aim to build web solutions that solve real-world problems and showcase our growing expertise in web programming.</p>       
                </div>
            </div>
        </section>

        <section class="team-section">
            <div class="container">
                <h2>Meet Our Team</h2>
                <div class="team-grid">
                    <div class="team-card">
                        <div class="team-image">
                            <img src="${pageContext.request.contextPath}/items/hero.jpeg" alt="Anij Gurung">
                        </div>
                        <h3>Anij Gurung</h3>
                        <span class="team-role">Team Member</span>
                        <p>With over 15 years of experience in floral design, Emma brings her artistic vision and passion for sustainability to every aspect of Flora.</p>
                    </div>

                    <div class="team-card">
                        <div class="team-image">
                            <img src="${pageContext.request.contextPath}/items/roshnee.jpg" alt="Roshnee Gurung">
                        </div>
                        <h3>Roshnee Gurung</h3>
                        <span class="team-role">Team Member</span>
                        <p>Michael's innovative arrangements have been featured in numerous publications. He specializes in creating unique, seasonal compositions.</p>
                    </div>

                    <div class="team-card">
                        <div class="team-image">
                            <img src="/placeholder.svg?height=200&width=200" alt="Ayush Gurung">
                        </div>
                        <h3>Ayush Gurung</h3>
                        <span class="team-role">Team Member</span>
                        <p>Sophia ensures that every order is processed with care and delivered on time, maintaining Flora's reputation for exceptional service.</p>
                    </div>

                    <div class="team-card">
                        <div class="team-image">
                            <img src="/placeholder.svg?height=200&width=200" alt="Prabesh Gurung">
                        </div>
                        <h3>Prabesh Gurung</h3>
                        <span class="team-role">Team Member</span>
                        <p>James works directly with local growers to source the freshest, most sustainable blooms for our arrangements and retail selection.</p>
                    </div>

                    <div class="team-card">
                        <div class="team-image">
                            <img src="/placeholder.svg?height=200&width=200" alt="Santosh B.K.">
                        </div>
                        <h3>Santosh B.k</h3>
                        <span class="team-role">Team Member</span>
                        <p>Olivia's warm personality and attention to detail ensure that every customer interaction with Flora is memorable and positive.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="values-section">
            <div class="container">
                <h2>Our Values</h2>
                <div class="values-grid">
                    <div class="value-item">
                        <div class="value-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm0 16a6 6 0 1 1 6-6 6 6 0 0 1-6 6z"></path><path d="M12 8v4l2.5 2.5"></path></svg>
                        </div>
                        <h3>Sustainability</h3>
                        <p>We prioritize eco-friendly practices in every aspect of our business, from sourcing to packaging.</p>
                    </div>
                    <div class="value-item">
                        <div class="value-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.42 4.58a5.4 5.4 0 0 0-7.65 0l-.77.78-.77-.78a5.4 5.4 0 0 0-7.65 0C1.46 6.7 1.33 10.28 4 13l8 8 8-8c2.67-2.72 2.54-6.3.42-8.42z"></path></svg>
                        </div>
                        <h3>Craftsmanship</h3>
                        <p>Each arrangement is handcrafted with care, attention to detail, and artistic sensibility.</p>
                    </div>
                    <div class="value-item">
                        <div class="value-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        </div>
                        <h3>Community</h3>
                        <p>We build strong relationships with local growers, artisans, and the communities we serve.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
<%@ include file="/includes/footer.jsp" %>
    
</body>
</html>