<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SuperMercadoOnline.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="principal principal--nosotros">
        <h3 class="titulo nosotros nosotros--tittle">About us</h3>
        <p class="texto nosotros nosotros--text">
            Company that since its inception has focused on providing the customer with better service, in order to
            make him happy and make his life a little easier, now that he has appeared at the covid world citation
            We want you to know that you can count on us as we are a company that likes to support its clients and
            make them happy.
        </p>
        <main class="about">

            <section class="history">
                <h3 class="titulo history__title">Trajectory</h3>
                <br />
                <article class="history__part">
                    <div class="titulo history__event">
                        <label>Year 2016.</label>
                    </div>
                    <div class="texto history__eventDescription">
                        <p>
                            Our first store starts in puntarenas centro with thousands of offers
                        and unimaginable possibilities for our clients.
                        </p>
                    </div>
                </article>
                <article class="history__part">
                    <div class="titulo history__event">
                        <label>Year 2017.</label>
                    </div>
                    <div class="texto history__eventDescription">
                        <p>
                            New modifications were presented to our facilities, regarding
                        to the space and structure, thus achieving a greater variety of products for our clients.
                        </p>
                    </div>
                </article>
                <article class="history__part">
                    <div class="titulo history__event">
                        <label>Year 2018.</label>
                    </div>
                    <div class="texto history__eventDescription">
                        <p>
                            We started with the implementation of service payments from our facilities
                        In addition, it offers the possibility of making them through a call from the community of your home.
                        </p>
                    </div>
                </article>
                <article class="history__part">
                    <div class="titulo history__event">
                        <label>Year 2019.</label>
                    </div>
                    <div class="texto history__eventDescription">
                        <p>
                            A frequent customer card is implemented which has information on discounts on its products
                        acquired more frequently and a user through which to make future purchases and use our digital platforms.
                        </p>
                    </div>
                </article>
                <article class="history__part">
                    <div class="titulo history__event">
                        <label>Year 2020.</label>
                    </div>
                    <div class="texto history__eventDescription">
                        <p>
                            The methodology for payment of web services and online purchases is implemented,
                        Through orders, these orders are brought by us to the community of your home.
                        </p>
                    </div>
                </article>
            </section>


            <section class="expectation">
                <h3 class="titulo expectation__title">Expectations about the company.</h3>
                <div class="expectation__container">
                    <article class="expectation__vision">
                        <h4 class="titulo expectation__vision__title">Visión</h4>
                        <p class="texto expectation__vision__text">Being the independent, innovative, honest and sustainable supermarket where you can make your purchases with the ability to choose and good prices. In other words, being a benchmark company model in the distribution sector..</p>
                    </article>
                    <article class="expectation__mission">
                        <h4 class="titulo expectation__mission__title">Misión</h4>
                        <p class="texto expectation__mission__text">Provide satisfaction to all our customers through a single purchase with unique qualities such as quality, variety, price and service, based on the attention and commitment that our workers will put in providing the best care and service.</p>
                    </article>
                </div>
            </section>

        </main>
    </div>
</asp:Content>
