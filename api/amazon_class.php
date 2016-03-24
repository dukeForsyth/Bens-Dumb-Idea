<?php
 
// Region code and Product ASIN
 
function getAmazonPrice($asin) {
 
	$xml = aws_signed_request("com", array(
		"Operation" => "ItemLookup",
		"ItemId" => $asin,
		"IncludeReviewsSummary" => False,
		"ResponseGroup" => "Medium,OfferSummary",
	));

//	$item = $xml->Items->Item;
//	$title = htmlentities((string) $item->ItemAttributes->Title);
//	$url = htmlentities((string) $item->DetailPageURL);
//	$image = htmlentities((string) $item->MediumImage->URL);
//	$price = htmlentities((string) $item->OfferSummary->LowestNewPrice->Amount);
//	$code = htmlentities((string) $item->OfferSummary->LowestNewPrice->CurrencyCode);
//	$qty = htmlentities((string) $item->OfferSummary->TotalNew);
// 
//	if ($qty !== "0") {
//		$response = array(
//			"code" => $code,
//			"price" => number_format((float) ($price / 100), 2, '.', ''),
//			"image" => $image,
//			"url" => $url,
//			"title" => $title
//		);
//	}
	return $xml;
}
 
function aws_signed_request($region, $params) {
 
	$public_key = "enterStuff";
    $private_key = "in these";
    $params["AssociateTag"] = "spots";
    
	$method = "GET";
	$host = "ecs.amazonaws." . $region;
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
 
	$pxml = @simplexml_load_string($response);
	if ($pxml === False) {
		return False;// no xml
	} else {
		return $pxml;
	}
}
 
?>