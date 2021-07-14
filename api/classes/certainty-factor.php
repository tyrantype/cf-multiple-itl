<?php

function calculateCFRule($data): float {
    return $data->mb * $data->md;
}

function calculateCFEnd($data): float {
    $value = processCalculateCFEnd($data, count($data) - 1);
    return $value;
    
}

function processCalculateCFEnd($data, $index): float {
    if($index < 2) {
        return calculateCFRule($data[$index - 1]) + calculateCFRule($data[$index]) -
            (calculateCFRule($data[$index - 1]) * calculateCFRule($data[$index]));
    } else {
        return processCalculateCFEnd($data, $index - 1) + calculateCFRule($data[$index]) -
            (processCalculateCFEnd($data, $index - 1) * calculateCFRule($data[$index]));
    }
}