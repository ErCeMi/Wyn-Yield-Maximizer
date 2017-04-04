

<community ID="020" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Lago Club" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="041" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Intracoastal Yacht Club" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="046" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Colony at Dadeland" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="047" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Royal Palms " %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="048" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Suncoast Place" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="051" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Stadium Tower" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="068" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Brickell First" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="081" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Sunshine Lakes Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="082" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Cypress Place Holdings" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="094" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Miami Riverfront Residences" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="095" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Gables 37" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pm2500" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "2500 Inverrary Club Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pm441" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Inverarry 441 Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmaha" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Aventura Harbor Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmcct" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Country Club Towers" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmcgv" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Cherry Grove Village Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmfbm" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Fontainebleau Milton" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmint" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "International Club Apartments" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmlbg" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Las Brisas Gardens Apts" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmmbc2" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">
  <% x = "Miami Bay Waterfront Midtown Residences" %>
  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>

<community ID="pmw49" POSTDATE="<%=Date.today%>" xmlns="" COMPANY="United Property Management">

  <units>
  <% Property.available_per_prop(x).each do |property| %>
    <unit ID="<%=x%>" AVAILDATE="<%= property.move_out != nil ? property.move_out.next_day(5) : DateTime.now %>" STATUS="On Notice" UNITTYPE="property.unit_type.unit_type" UNITCAT="11" AMENITYVALUE="0.00">
      <% PropertyName.all[Property.building_names.index(x)].lease_terms.split(",").map{ |i| i.to_i}.each do |month| %>
        <% if property.group ==   "Vacant Unrented Not Ready" ||  "Vacant Unrented Ready" %>
          <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
        <% elsif property.group == "Notice Unrented"  %>
          <% if property.move_out.next_day(5).strftime("%Y%m") <= DateTime.now.strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent0(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(1).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent1(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(2).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent2(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(3).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent3(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(4).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent4(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <% elsif property.move_out.next_day(5).strftime("%Y%m") == DateTime.now.next_month(5).strftime("%Y%m") %>
            <offeredterm LT="<%=month%>" BASERENT="0.00" TOTALCONCESSION="0.00" EFFECTIVERENT="<%= number_to_currency @bed_premiums_per_building[x].calculate_rent5(((property.unit_rent * ( 1.0 + ((property.move_out.year * 12.0 + property.move_out.month ) - (property.unit_type.market_rate_date.year * 12.0 + property.unit_type.market_rate_date.month)) / 12.0 * property.unit_type.growth_rate)) - property.unit_type.amount_off - ( property.unit_rent * property.unit_type.percentage_off) ), property.unit_type.bedroom.to_i, month), precision: 0 %>" CONTYPE="T" CONVALUE="0.00"/>
          <%end%>
        <%end%>
      <%end%>
    </unit>
  <%end%>
  </units>

</community>
