<#ftl output_format="HTML">
<#assign pageName = "search">
<#include "layout/default.ftl">

<#macro content>
<div class="search-container">

<div class="row">
    <div class="col-md-3">
        <div class="filter-container">
            <h2>Φίλτρα</h2>
            <form method="GET" action="/search/filtered">
                <div class="panel panel-search-primary">
                    <div class="panel-heading">Δραστηριότητες</div>
                    <div class="panel-body">
                        <div class="activity-checkbox-filter">
                            <#list allcategories as allca>
                                <input type="checkbox" name="category_checkbox" value=${allca}/> ${allca} <br/>
                            </#list>
                        </div>
                    </div>
                    <div class="panel-heading">Ημερομηνία & Ώρα</div>
                    <div class="panel-body">
                        <div class="Date-filter">
                            <input type="datetime-local" class="form-control" name="datetimepick_filter" id="datetimepicker"
                                   name="event_date"/>
                            <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
                        </div>
                    </div>
                    <div class="panel-heading">Αξιολογήσεις</div>
                    <div class="panel-body">
                        <div class="rating-radio-filter">
                            <form>
                                <input type="radio" name="rating" value="4"> τουλάχιστον 4 αστέρια <br>
                                <input type="radio" name="rating" value="3"> τουλάχιστον 3 αστέρια <br>
                                <input type="radio" name="rating" value="2"> τουλάχιστον 2 αστέρια <br>
                            </form>
                        </div>
                    </div>
                    <div class="panel-heading">Έυρος Τιμής</div>
                    <div class="panel-body">
                        <div class="Price-filter">
                            <input type="text" class="price" id="price-min" placeholder="Από" name="price-min">
                        </div>
                        <div class="Price-filter">
                            <input type="text" class="price" id="price-max" placeholder="Εως" name="price-max">
                        </div>
                    </div>
                    <input type="hidden" name="hiddn" value="1">
                    <input type="submit" class="btn btn-default btn-md pull-right" value="Apply Filters &raquo"/>
                </div>
            </form>
        </div>
    </div>

    <#if events?has_content>
        <ul class="list-group" id="search_list">
            <#list events as ev>
                <li class="list-group-item">
                    <div class="row-md-9">
                        <div class="results-search-container2">
                            <div class="items-in-list">
                                <div class="thumbnail">
                                    <img src="/assets/images/www.jpg">
                                    <div class="caption">
                                        <a href="/provider/${ev.getProviderMetadataByProviderId().getUserByUserId().getEmail()}">${ev.getProviderMetadataByProviderId().getCompanyName()}</a>
                                        <h4 class="pull-right">${ev.getPrice()} euro</h4>
                                        <h4><a href="/info/${ev.getId()}">${ev.getTitle()}</a></h4>
                                        <p>${ev.getDescription()}.</p>
                                    </div>
                                    <div class="ratings">
                                        <p class="pull-right">${ev.getProviderMetadataByProviderId().getNumberOfRatings()} Ψήφοι</p>
                                        <#assign provider = ev.getProviderMetadataByProviderId()>
                                        <#list 1..5 as x>
                                            <#if provider.getNumberOfRatings() == 0>
                                                <span class='glyphicon glyphicon-star-empty'></span>
                                            <#else>
                                                <span class='glyphicon glyphicon-star${(x > (provider.getRating()/provider.getNumberOfRatings()))?then('-empty','')}'></span>
                                            </#if>
                                        </#list>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>
    <#else>
        <ul class="list-group" id="search_list">
            <#list allevents as ev1>
                <li class="list-group-item">
                    <div class="row-md-9">
                        <div class="results-search-container2">
                            <div class="items-in-list">
                                <div class="thumbnail">
                                    <img src="/assets/images/www.jpg">
                                    <div class="caption">
                                        <a href="/provider/${ev1.getProviderMetadataByProviderId().getUserByUserId().getEmail()}">${ev1.getProviderMetadataByProviderId().getCompanyName()}</a>
                                        <h4 class="pull-right">${ev1.getPrice()} euro</h4>
                                        <h4><a href="/info/${ev1.getId()}">${ev1.getTitle()}</a></h4>
                                        <p>${ev1.getDescription()}.</p>
                                    </div>
                                    <div class="ratings">
                                        <p class="pull-right">${ev1.getProviderMetadataByProviderId().getNumberOfRatings()} Ψήφοι</p>
                                        <#assign provider = ev1.getProviderMetadataByProviderId()>
                                        <#list 1..5 as x>
                                            <#if provider.getNumberOfRatings() == 0>
                                                <span class='glyphicon glyphicon-star-empty'></span>
                                            <#else>
                                                <span class='glyphicon glyphicon-star${(x > (provider.getRating()/provider.getNumberOfRatings()))?then('-empty','')}'></span>
                                            </#if>
                                        </#list>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>
    </#if>


</#macro>

<@display_page/>
