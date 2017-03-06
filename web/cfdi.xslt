<?xml version="1.0" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:cfdi="http://www.sat.gob.mx/cfd/3"
                xmlns:ecc="http://www.sat.gob.mx/ecc"
                xmlns:psgecfd="http://www.sat.gob.mx/psgecfd"
                xmlns:donat="http://www.sat.gob.mx/donat"
                xmlns:divisas="http://www.sat.gob.mx/divisas"
                xmlns:detallista="http://www.sat.gob.mx/detallista"
                xmlns:ecb="http://www.sat.gob.mx/ecb"
                xmlns:implocal="http://www.sat.gob.mx/implocal"
                xmlns:terceros="http://www.sat.gob.mx/terceros"
                xmlns:iedu="http://www.sat.gob.mx/iedu"
                xmlns:ventavehiculos="http://www.sat.gob.mx/ventavehiculos"
                xmlns:pfic="http://www.sat.gob.mx/pfic"
                xmlns:tpe="http://www.sat.gob.mx/TuristaPasajeroExtranjero"
                xmlns:leyendasfisc="http://www.sat.gob.mx/leyendasFiscales"
                xmlns:spei="http://www.sat.gob.mx/spei"
                xmlns:nomina="http://www.sat.gob.mx/nomina"
                xmlns:registrofiscal="http://www.sat.gob.mx/registrofiscal"
                xmlns:pagoenespecie="http://www.sat.gob.mx/pagoenespecie"
                xmlns:consumodecombustibles="http://www.sat.gob.mx/consumodecombustibles"
                xmlns:valesdedespensa="http://www.sat.gob.mx/valesdedespensa"
                xmlns:aerolineas="http://www.sat.gob.mx/aerolineas"
                xmlns:notariospublicos="http://www.sat.gob.mx/notariospublicos"
                xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital"
>

    <xsl:template match="cfdi:Comprobante">
        <xsl:variable name="emisor" select="cfdi:Emisor" />
        <xsl:variable name="emisorDom" select="cfdi:Emisor/cfdi:DomicilioFiscal" />
        <xsl:variable name="receptor" select="cfdi:Receptor" />
        <xsl:variable name="receptorDom" select="cfdi:Receptor/cfdi:Domicilio" />
        <xsl:variable name="regimen" select="cfdi:Emisor/cfdi:RegimenFiscal" />
        <xsl:variable name="timbre" select="cfdi:Complemento/tfd:TimbreFiscalDigital" />
        <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="utf-8" />
                <title>CFDi</title>
            </head>
            <body style="font-family: Calibri">
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%" >
                                <tr>
                                    <td colspan="3" style="text-align: center;">
                                        <h3 style="font-size: 15px"> [encabezado]</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img width="220px" src="data:image/png;base64,[logo]"/>
                                    </td>
                                    <td width="40%">
                                        <table style="font-size: 11px">
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>RFC:</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$emisor/@rfc"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Nombre o Razón Social</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$emisor/@nombre"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Régimen Fiscal:</strong>
                                                </td>
                                                <td>

                                                    <xsl:value-of select="$regimen/@Regimen"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Dirección Fiscal:</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$emisorDom/@calle"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@noExterior"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@noInterior"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@colonia"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@municipio"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@localidad"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@referencia"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@estado"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@codigoPostal"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$emisorDom/@pais"/>
                                                </td>

                                            </tr>

                                        </table>
                                    </td>
                                    <td width="30%">
                                        <table style="font-size: 11px">
                                            <tr>
                                                <td style="text-align: left; width:30%;">
                                                    <strong>Folio:</strong>
                                                </td>
                                                <td style="text-align: left; width:50%;">
                                                    <xsl:value-of select="@serie"/>
                                                    <xsl:value-of select="@folio"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left; width:30%;">
                                                    <strong>Folio Fiscal:</strong>
                                                </td>
                                                <td style="text-align: left; width:50%;">
                                                    <xsl:value-of select="$timbre/@UUID"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left; width:30%;">
                                                    <strong>No de Serie del Certificado del CSD:</strong>
                                                </td>
                                                <td style="text-align: left; width:50%;">
                                                    <xsl:value-of select="$timbre/@noCertificadoSAT"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Lugar. fecha y hora de emisión:</strong>
                                                </td>
                                                <td style="text-align: left">
                                                    <xsl:value-of select="@LugarExpedicion"/>
                                                    <br/>
                                                    <xsl:value-of select="@fecha"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td><br />
                            <table style="width: 100%; border: 1px solid black">
                                <tr>
                                    <td>
                                        <h3 style="font-size: 15px">Receptor</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="font-size: 12px">
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>RFC:</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$receptor/@rfc"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Nombre o Razón Social:</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$receptor/@nombre"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Dirección Fiscal:</strong>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="$receptorDom/@calle"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@noExterior"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@noInterior"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@colonia"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@municipio"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@localidad"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@referencia"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@estado"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@codigoPostal"/>
                                                    <xsl:text></xsl:text>
                                                    <xsl:value-of select="$receptorDom/@pais"/>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td><br />
                            <table style="width: 100%; border: 1px solid black">
                                <tr>
                                    <td>
                                        <h3 style="font-size: 15px">Conceptos</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" colspan="2">
                                        <table style="font-size: 12px; width: 100%; border: 1px solid darkblue; border-left: 1px solid darkblue; border-right: 1px solid darkblue; border-collapse: collapse">
                                            <tr>
                                                <th style="width: 15%; text-align: center; border-right: 1px solid darkblue">
                                                    <strong>Cantidad</strong>
                                                </th>
                                                <th style="width: 15%; text-align: center; border-right: 1px solid darkblue">
                                                    <strong>Unidad de Medida</strong>
                                                </th>
                                                <th style="width: 40%; text-align: center; border-right: 1px solid darkblue">
                                                    <strong>Descripción</strong>
                                                </th>
                                                <th style="width: 15%; text-align: center; border-right: 1px solid darkblue">
                                                    <strong>Precio Unitario</strong>
                                                </th>
                                                <th style="width: 15%; text-align: center;">
                                                    <strong>Importe</strong>
                                                </th>

                                            </tr>
                                            <xsl:for-each select="cfdi:Conceptos/cfdi:Concepto">
                                                <tr>
                                                    <td style="width: 15%; text-align: center; border-right: 1px solid darkblue">
                                                        <xsl:value-of select="@cantidad"/>
                                                    </td>
                                                    <td style="width: 15%; text-align: center; border-right: 1px solid darkblue">
                                                        <xsl:value-of select="@unidad"/>
                                                    </td>
                                                    <td style="width: 40%; text-align: center; border-right: 1px solid darkblue">
                                                        <xsl:value-of select="@descripcion"/>
                                                    </td>
                                                    <td style="width: 15%; text-align: center; border-right: 1px solid darkblue; text-align: right">
                                                        $
                                                        <xsl:value-of select="format-number(@valorUnitario, '#,##0.00')"/>
                                                    </td>
                                                    <td style="width: 15%; text-align: center; text-align: right">
                                                        $
                                                        <xsl:value-of select="format-number(@importe, '#,##0.00')"/>
                                                    </td>

                                                </tr>
                                            </xsl:for-each>
                                        </table>
                                    </td>


                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td><br />
                            <table style="width: 100%; border: 1px solid black">
                                <tr>
                                    <td style="width: 70%;">
                                        <table style="font-size: 12px">
                                            <tr>
                                                <td style="text-align: left">
                                                    <strong>Total Con Letra:</strong>
                                                </td>
                                                <td>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    [TotalLetra]
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 30%;">
                                        <table style="width: 100%; font-size: 12px">
                                            <tr>
                                                <td style="width: 50%; text-align: right">
                                                    <strong>SubTotal:</strong>
                                                </td>
                                                <td style="width: 50%; text-align: right">
                                                    $
                                                    <xsl:value-of select="format-number(@subTotal, '#,##0.00')"/>
                                                </td>

                                            </tr>
                                            <xsl:for-each select="cfdi:Impuestos/cfdi:Retenciones/cfdi:Retencion">
                                                <tr>
                                                    <td style="width: 50%; text-align: right">
                                                        <strong>
                                                            Retención:
                                                            <xsl:value-of select="@impuesto"/>
                                                        </strong>
                                                    </td>

                                                    <td style="width: 50%; text-align: right">
                                                        $
                                                        <xsl:value-of select="format-number(@importe, '#,##0.00')"/>
                                                    </td>

                                                </tr>
                                            </xsl:for-each>
                                            <xsl:for-each select="cfdi:Impuestos/cfdi:Traslados/cfdi:Traslado">
                                                <tr>
                                                    <td style="width: 50%; text-align: right">
                                                        <strong>
                                                            Traslado:
                                                            <xsl:value-of select="@impuesto"/>
                                                            (
                                                            <xsl:value-of select="@tasa"/>
                                                            )
                                                        </strong>
                                                    </td>

                                                    <td style="width: 50%; text-align: right">
                                                        $
                                                        <xsl:value-of select="format-number(@importe, '#,##0.00')"/>
                                                    </td>

                                                </tr>
                                            </xsl:for-each>
                                            <tr>
                                                <td style="width: 50%; text-align: right">
                                                    <strong>Total:</strong>
                                                </td>
                                                <td style="width: 50%; text-align: right">
                                                    $
                                                    <xsl:value-of select="format-number(@total, '#,##0.00')"/>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td><br />
                            <table style="width: 100%; border: 1px solid black">
                                <tr>
                                    <td>
                                        <h3 style="font-size: 15px">Observaciones:</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p style="font-size: 11px">[observaciones]</p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><strong style="font-size: 13px">Sello Digital del SAT:</strong></td>
                                            </tr>
                                            <tr>
                                                <td><p style="font-size: 11px">[selloSat]</p></td>
                                            </tr>
                                            <tr>
                                                <td><strong style="font-size: 13px">Cadena Original del complemento de certificación digital del SAT:</strong></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: 11px">
                                                    ||
                                                    <xsl:value-of select="$timbre/@version"/>
                                                    |
                                                    <xsl:value-of select="$timbre/@UUID"/>
                                                    |
                                                    <xsl:value-of select="$timbre/@FechaTimbrado"/>
                                                    |
                                                    [sello]|
                                                    [selloSat]||
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong style="font-size: 13px">No de Serie del Certificado del SAT:</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: 11px">
                                                    <xsl:value-of select="$timbre/@noCertificadoSAT"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong style="font-size: 13px">Fecha y hora de certificación:</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: 11px">
                                                    <xsl:value-of select="$timbre/@FechaTimbrado"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 30%; text-align: center">
                                        <img width="150" height="150" src="data:image/png;base64,[qrcode]"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-top: 2px solid black">
                            <p style="font-size: 15px">[pie]</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-top: 2px solid black">
                            <strong style="font-size: 12px">
                                Este documento es una representación impresa de un CFDI
                            </strong>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>