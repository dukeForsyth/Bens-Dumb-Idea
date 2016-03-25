<?php
 
// Region code and Product ASIN
 
function getAmazonPrice($asin) {
	$xml = aws_signed_request("com", array(
		"Operation" => "ItemLookup",
		"ItemId" => $asin,
		"IncludeReviewsSummary" => False,
		"ResponseGroup" => "Medium,OfferSummary",
	));
    $count = count($xml->Items->Item);

    for ($i = 0; $i < $count; $i++) {
        $price = htmlentities((string) $xml->Items->Item[$i]->OfferSummary->LowestNewPrice->Amount);
        $response[$i] = number_format((float) ($price / 100), 2, '.', '');
    }
	return $response;
}
 
function aws_signed_request($region, $params) {
 
$public_key = "AKIAI5OHKOWHPILW4JBA";
$private_key = "Y4Ft7B7q/z/tzoTsKQf1oLbUQYmhF1WzBJJw/h0i";
$params["AssociateTag"] = "pche00b-20";
    
	$method = "GET";
	$host = "webservices.amazon." . $region;
	$uri = "/onca/xml";
 
	$params["Service"] = "AWSECommerceService";
	$params["AWSAccessKeyId"] = $public_key;
	$params["Timestamp"] = gmdate("Y-m-d\TH:i:s\Z");
	$params["Version"] = "2013-08-01";
 
	ksort($params);
 
	$canonicalized_query = array();
	foreach ($params as $param => $value) {
		$param = str_replace("%7E", "~", rawurlencode($param));
		$value = str_replace("%7E", "~", rawurlencode($value));
		$canonicalized_query[] = $param . "=" . $value;
	}
 
	$canonicalized_query = implode("&", $canonicalized_query);
 
	$string_to_sign = $method . "\n" . $host . "\n" . $uri . "\n" . $canonicalized_query;
	$signature = base64_encode(hash_hmac("sha256", $string_to_sign, $private_key, True));
	$signature = str_replace("%7E", "~", rawurlencode($signature));
 
	$request = "http://" . $host . $uri . "?" . $canonicalized_query . "&Signature=" . $signature;

	$response = file_get_contents($request);

	$pxml = simplexml_load_string($response);
	if ($pxml === False) {
		return False;// no xml
	} else {
		return $pxml;
	}
}
 
?>