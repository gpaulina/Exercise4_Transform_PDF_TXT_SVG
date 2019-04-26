<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				version="2.0">
    <xsl:template match="watchingLibraryReport">
        <svg width="100cm" height="100cm"  xmlns="http://www.w3.org/2000/svg">
            
            <script type="text/ecmascript">
                <![CDATA[
                    function changeColor(evt){
                    evt.target.setAttributeNS(null,"fill","MediumVioletRed");
                    }
                    function changeColorBack(evt){
                    evt.target.setAttributeNS(null,"fill","#FFF0F5");
                    }
                    function hide(x,y){
                    var style = document.getElementById(x).style.display;
                    if(style === "none"){
                        document.getElementById(x).style.display = "block";
                        document.getElementById(y).style.display = "block";
                        }
                    else{
                        document.getElementById(x).style.display = "none";
                        document.getElementById(y).style.display = "none";
                        }
                    }
                   function fun(evt) {
                   var circle = evt.target;
                   var currentRadius = circle.getAttribute("r");
                   if(currentRadius ==20 )
                   circle.setAttribute("r", currentRadius * 2);
                    else
                   circle.setAttribute("r", currentRadius * 0.5);
                    }
                ]]>
            </script>
        
             <rect width="100%" height="100%" fill="AliceBlue"/>
           
            <text x="70" y="70" font-family="Verdana" font-size="50" fill="MediumVioletRed" text-decoration="overline" >Movies and series rates</text>
      
            <xsl:for-each select="item">
                <xsl:variable name="position" select="position()*40+20"/>
                <xsl:variable name="position2" select="position()*40"/>
                <xsl:variable name="position3" select="position()*40+12"/>
                <xsl:variable name="rateHeight" select="@rate*100-500" />
                <xsl:variable name="rateHeight2" select="@rate*100-50" />
                <xsl:variable name="rateHeight3" select="@rate*100-43" />
                <rect onmouseover="changeColor(evt)" onmouseout="changeColorBack(evt)" onclick="hide('{$position}','{$position2}')" x="{$position2}" y="400" height="0" width="25" fill="#FFF0F5" stroke="black" stroke-width="1">
                    <animate attributeType="XML" attributeName="height" from="0" to="{$rateHeight}" dur="2s" fill="freeze"/>
                </rect>
                <circle onclick="fun(evt)" id="{$position}" cx="{$position3}" cy="{$rateHeight2}" r="20" stroke="black" stroke-width="1" fill="#FFF0F5" display="none" >
                </circle>
                
                <g id="{$position2}" display="none">
                <text x="{$position2}" y="{$rateHeight3}" font-family="Verdana" font-size="15" fill="#8b0e5d" >
                        <xsl:value-of select="@rate" />
                </text>
                </g>
                <text  transform="translate({$position},375)rotate(-90)" font-family="Verdana" font-size="20" font-style="italic" fill="#8b0e5d" >     
                        <xsl:value-of select="." />
                </text>
                
            </xsl:for-each>         
        </svg>
    </xsl:template>
</xsl:stylesheet>