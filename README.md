# gem5_tardistso
Repository che contiene la patch per installare il protocollo Tardis 2.0 - Total Store Order nel simulatore gem5 versione 23.1

# Requisiti
Architettura macchina host: x86

Ubuntu 22.04 nativo oppure WSL 2 con Ubuntu 22.04 (se su Windows) 

# Istruzioni
Basterà eseguire gli script secondo l'ordine enumerato:
* ./1.install_requirements.sh: installa i pacchetti richiesti per buildare il simulatore;
* ./2.install_gem5.sh: clona la repository di gem5, passa alla versione 23.1 e installa la patch di Tartdis TSO;
* ./3.build_gem5.sh: compila gem5 per X86 o ARM (opzione -a), con protocollo TARDISTSO, MSI o MI (opzione -p)
* ./4.run_workload.sh: esegue su X86 o ARM (opzione -a), con protocollo TARDISTSO, MSI o MI (opzione -p) uno dei workload di test mfence, spinlock, random_array o false_sharing (opzione -w)
* ./5.run_ubuntu_boot.sh: esegue un boot completo di linux (richiede dall 2 alle 8 ore) per X86 con TARDIS TSO.

# Problemi noti
La compilazione per ARM presenta un errore di compile-error.
