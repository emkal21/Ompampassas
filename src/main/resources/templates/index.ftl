<#ftl output_format="HTML">
<#assign pageName = "index">
<#include "layout/default.ftl">

<#macro content>
<div class="jumbotron">
    <div class="search_bar_container">
        <form method="GET" action="/search">
            <div class="container">
                <h2 style="color: whitesmoke"><i>Αναζητήστε Δραστηριότητες</i></h2>
                <div class="panel panel-success">
                    <div class="panel-body">
                        <div class="form-group has-feedback">
                            <label for="keywordsearch" style="color: whitesmoke">Λέξεις Κλειδία:</label>
                            <input type="text" class="form-control" name="keyword" id="keywordsearch"
                                   placeholder="π.χ. Παιδότοποι"/>
                            <i class="glyphicon glyphicon-search  form-control-feedback"></i>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="datetimepicker" style="color: whitesmoke">Ημερομηνία:</label>
                            <input type="datetime-local" class="form-control" name="datetimepick"
                                   id="datetimepicker"/>
                            <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="areasearch" style="color: whitesmoke">Περιοχή:</label>
                            <input type="text" class="form-control" name="area" id="areasearch"
                                   placeholder="π.χ. Ζωγράφου"/>
                            <i class="form-control-feedback glyphicon glyphicon-map-marker "></i>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success btn-lg pull-right" value="Αναζήτηση &raquo"/>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="container-fluid">
    <div class="well" style="text-align: center;">
        <h2 style="color: dimgrey">Δημοφιλέστεροι πάροχοι</h2>
    </div>
    <div class="slickClass slider">
        <#list attributes as info>
            <div>
                <img src="/assets/${info.getFinalPic()}"/>
                <div class="panel panel-success">
                    <h3>${info.getTitle()}</h3>
                    <div>
                        <#list 1..5 as x>
                            <span class='glyphicon glyphicon-star${(x > info.providerRating)?then('-empty','')}'></span>
                        </#list>
                    </div>
                    <h4>${info.getNumOfRatings()} ψήφοι</h4>
                    <p><a class="btn btn-default" href="/provider/${info.getProviderName()}" role="button">Δείτε Τώρα
                        &raquo;</a></p>
                </div>
            </div>
        </#list>
    </div>
</div>

</#macro>

<@display_page/>