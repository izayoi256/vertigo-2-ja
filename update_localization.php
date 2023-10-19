<?php

$src = new \SplFileObject(__DIR__ . '/Vertigo 2/vertigo2_Data/StreamingAssets/Localization/V2_localization.dist.csv', 'r');
$ja = new \SplFileObject(__DIR__ . '/Vertigo 2/vertigo2_Data/StreamingAssets/Localization/V2_localization.ja.csv', 'r');
$dst = new \SplFileObject(__DIR__ . '/Vertigo 2/vertigo2_Data/StreamingAssets/Localization/V2_localization.csv', 'w');

$src->setFlags(\SplFileObject::READ_CSV | \SplFileObject::SKIP_EMPTY);
$ja->setFlags(\SplFileObject::READ_CSV | \SplFileObject::SKIP_EMPTY);

$header = true;
foreach ($src as $line) {
    if (!$ja->valid() || empty($line)) {
        break;
    }
    $jaValue = $ja->current()[1] ?? null;
    if ($header) {
        $jaValue = 'en';
        $header = false;
    }
    $line[1] = $jaValue;
    $ja->next();
    $dst->fputcsv($line);
}
