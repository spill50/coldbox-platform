<!-----------------------------------------------------------------------Author 	 :	Luis MajanoDate     :	September 25, 2005Description : 				General handler for my hello application. Please remember to alter	your extends base component using the Coldfusion Mapping.	example:		Mapping: fwsample		Argument Type: fwsample.system.eventhandlerModification History:Sep/25/2005 - Luis Majano	-Created the template.-----------------------------------------------------------------------><cfcomponent name="ehTest" extends="coldbox.system.eventhandler">	<!--- ************************************************************* --->	<cffunction name="dspHello" access="public" returntype="string">		<!--- Create a tracer message --->		<cfset getPlugin("logger").tracer("Starting dspHello. Using default name")>		<!--- Set the firstname Value --->		<cfset setValue("firstname",getSetting("Codename", true) & getSetting("Version", true))>		<!--- Set the View To Display, after Logic --->		<cfset setView("vwHello")>		<!--- Set another tracer variable --->		<cfset getPlugin("logger").tracer("View has been set")>		<!--- Create a simple permanent variable --->		<cfset getPlugin("clientstorage").setvar("luis","Luis Majano")>		<!--- Permanent Complex Variable --->		<cfset complexStruct = structnew()>		<cfset complexStruct.today = now()>		<cfset complexStruct.message = "This is a complex variable.">		<cfset complexStruct.BitFlag = "1">		<cfset getPlugin("clientstorage").setvar("complexStruct",complexStruct)>		<cfset complete = isEmail("info@coldboxframework.com")>		<!--- Create an info MessageBox --->		<cfset getPlugin("messagebox").setMessage("info", "Hello and welcome to the Textus' message box. You can place messages here from any of your applications. You can also choose the desired image to display. You can set error message, warning messages or just plain informative messages like this one. You can do this by using the <b>messagebox</b> plugin.")>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doChangeLocale" access="public" returntype="void">		<!--- Change Locale --->		<cfset getPlugin("i18n").setfwLocale(getValue("locale"))>		<cfset dspHello()>	</cffunction>	<!--- ************************************************************* --->		<!--- ************************************************************* --->	<cffunction name="dspapi" access="public" returntype="void" output="false">		<cfset rc.cfcViewer = getPlugin("cfcViewer")>		<cfset paramValue("show", "plugins")>		<cfif rc.show eq "plugins">			<cfset rc.cfcViewer.setup("/coldbox/system/plugins","coldbox/system/plugins")>		<cfelse>			<cfset rc.cfcViewer.setup("/coldbox/system/","coldbox/system/")>		</cfif>				<cfset setView("vwAPI")>	</cffunction>	<!--- ************************************************************* --->	</cfcomponent>