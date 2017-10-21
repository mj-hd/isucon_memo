# MEMO

# profiling
http.ListenAndServeだと、systemdからstopされたときにdeferが呼ばれてないっぽい  
やるなら、以下の用に  
```
mainのどこか
p := profile.Start(profile.BlockProfile, profile.ProfilePath("/tmp/profile"), profile.NoShutdownHook)
//p := profile.Start(profile.CPUProfile, profile.ProfilePath("/tmp/profile"), profile.NoShutdownHook)
//p := profile.Start(profile.MemProfile, profile.ProfilePath("/tmp/profile"), profile.NoShutdownHook)

go func() {
	http.ListenAndServe(...)
}()

sigCh := make(chan os.Signal, 1)
signal.Notify(sigCh, syscall.SIGHUP, syscall.SIGINT, syscall.SIGTERM, syscall.SIGQUIT)
<-sigCh
p.Stop()
```

ちなみに、Profilingは別のProfileに多大な影響を与えるため、一つの実行につき一つのProfileしかとってはならない。  
benchでは、Blockだけとった方がよさそ  

# pt-query-digest
percona-toolkit  
TCPDUMP, slowquerylog, generallog, binlog

# alp
最新版
https://github.com/tkuchiki/alp/releases/download/v0.3.1/alp_linux_amd64.zip

# journalctl
特定のサービスについて、journalctl -u test
