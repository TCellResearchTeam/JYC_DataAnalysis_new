#PBS -l nodes=1:ppn=8
#PBS -l mem=16gb

module load sra-tools

cd /gpfs/home/hdiao/jycATAC/GEO_RNA

# GSE105808_RNA
fastq-dump --split-files SRR6203712 &
fastq-dump --split-files SRR6203713 &
fastq-dump --split-files SRR6203714 &
fastq-dump --split-files SRR6203715 &
fastq-dump --split-files SRR6203716 &
fastq-dump --split-files SRR6203717 &

# GSE106464_RNA_invitro
fastq-dump --split-files SRR6246592 &
fastq-dump --split-files SRR6246594
wait
fastq-dump --split-files SRR6246595 &
fastq-dump --split-files SRR6246596 &
fastq-dump --split-files SRR6246597 &
fastq-dump --split-files SRR6246598 &
fastq-dump --split-files SRR6246599 &
fastq-dump --split-files SRR6246590 &
fastq-dump --split-files SRR6246591 &
fastq-dump --split-files SRR6246600
wait
fastq-dump --split-files SRR6246601 &
fastq-dump --split-files SRR6246602 &
fastq-dump --split-files SRR6246603 &
fastq-dump --split-files SRR6246604 &
fastq-dump --split-files SRR6246607 &
fastq-dump --split-files SRR6246608 &
fastq-dump --split-files SRR6246609 &
fastq-dump --split-files SRR6246610
wait
fastq-dump --split-files SRR6246611 &
fastq-dump --split-files SRR6246612 &
fastq-dump --split-files SRR6246613 &
fastq-dump --split-files SRR6246593 &
fastq-dump --split-files SRR6246605 &
fastq-dump --split-files SRR6246606 &
fastq-dump --split-files SRR6246614 &
fastq-dump --split-files SRR6246615
wait
fastq-dump --split-files SRR6246616 &
fastq-dump --split-files SRR6246617 &
fastq-dump --split-files SRR6246618 &
fastq-dump --split-files SRR6246619 &
fastq-dump --split-files SRR6246620 &
fastq-dump --split-files SRR6246621 &
fastq-dump --split-files SRR6246622 &
fastq-dump --split-files SRR6246623
wait
fastq-dump --split-files SRR6246624 &
fastq-dump --split-files SRR6246625 &
fastq-dump --split-files SRR6246626 &
fastq-dump --split-files SRR6246627 &
fastq-dump --split-files SRR6246628 &
fastq-dump --split-files SRR6246629 &
fastq-dump --split-files SRR6246630 &
fastq-dump --split-files SRR6246631
wait
fastq-dump --split-files SRR6246632 &
fastq-dump --split-files SRR6246633 &
fastq-dump --split-files SRR6246634 &
fastq-dump --split-files SRR6246635 &
fastq-dump --split-files SRR6246636 &
fastq-dump --split-files SRR6246637 &
fastq-dump --split-files SRR6246638 &
fastq-dump --split-files SRR6246639
wait
fastq-dump --split-files SRR6246640 &
fastq-dump --split-files SRR6246641 &
fastq-dump --split-files SRR6246642 &
fastq-dump --split-files SRR6246643 &
fastq-dump --split-files SRR6246644 &
fastq-dump --split-files SRR6246645 &
fastq-dump --split-files SRR6246647 &
fastq-dump --split-files SRR6246648
wait
fastq-dump --split-files SRR6246649 &
fastq-dump --split-files SRR6246650 &
fastq-dump --split-files SRR6246651 &
fastq-dump --split-files SRR6246652 &
fastq-dump --split-files SRR6246653 &
fastq-dump --split-files SRR6246654 &
fastq-dump --split-files SRR6246655 &
fastq-dump --split-files SRR6246656
wait
fastq-dump --split-files SRR6246657 &
fastq-dump --split-files SRR6246658 &
fastq-dump --split-files SRR6246659 &
fastq-dump --split-files SRR6246660 &
fastq-dump --split-files SRR6246661 &
fastq-dump --split-files SRR6246662 &
fastq-dump --split-files SRR6246663 &
fastq-dump --split-files SRR6246664
wait 
fastq-dump --split-files SRR6246665 &
fastq-dump --split-files SRR6246666 &
fastq-dump --split-files SRR6246667 &
fastq-dump --split-files SRR6246668 &
fastq-dump --split-files SRR6246669 &
fastq-dump --split-files SRR6246670 &
fastq-dump --split-files SRR6246671 &
fastq-dump --split-files SRR6246672
wait
fastq-dump --split-files SRR6246673 &
fastq-dump --split-files SRR6246674 &
fastq-dump --split-files SRR6246675 &
fastq-dump --split-files SRR6246676 &
fastq-dump --split-files SRR6246677 &
fastq-dump --split-files SRR6246678 &
fastq-dump --split-files SRR6246679 &
fastq-dump --split-files SRR6246680
wait
fastq-dump --split-files SRR6246681 &
fastq-dump --split-files SRR6246682 &
fastq-dump --split-files SRR6246683 &
fastq-dump --split-files SRR6246684 &
fastq-dump --split-files SRR6246685 &
fastq-dump --split-files SRR6246686 &
fastq-dump --split-files SRR6246687 &
fastq-dump --split-files SRR6246688
wait
fastq-dump --split-files SRR6246689 &
fastq-dump --split-files SRR6246690 &
fastq-dump --split-files SRR6246691 &
fastq-dump --split-files SRR6246692 &
fastq-dump --split-files SRR6246693 &
fastq-dump --split-files SRR6246694 &
fastq-dump --split-files SRR6246695 &
fastq-dump --split-files SRR6246696
wait 
fastq-dump --split-files SRR6246697 &
fastq-dump --split-files SRR6246698 &
fastq-dump --split-files SRR6246699 &
fastq-dump --split-files SRR6246700 &
fastq-dump --split-files SRR6246701 &
fastq-dump --split-files SRR6246702 &
fastq-dump --split-files SRR6246703 &
fastq-dump --split-files SRR6246704
wait
fastq-dump --split-files SRR6246705 &
fastq-dump --split-files SRR6246706 &
fastq-dump --split-files SRR6246707 &
fastq-dump --split-files SRR6246708 &
fastq-dump --split-files SRR6246709 &
fastq-dump --split-files SRR6246710 &
fastq-dump --split-files SRR6246711 &
fastq-dump --split-files SRR6246712
wait
fastq-dump --split-files SRR6246713 &
fastq-dump --split-files SRR6246714 &
fastq-dump --split-files SRR6246715 &
fastq-dump --split-files SRR6246716 &
fastq-dump --split-files SRR6246717 &
fastq-dump --split-files SRR6246718 &
fastq-dump --split-files SRR6246719 &
fastq-dump --split-files SRR6246720
wait
fastq-dump --split-files SRR6246721 &
fastq-dump --split-files SRR6246722 &
fastq-dump --split-files SRR6246723 &
fastq-dump --split-files SRR6246724 &

# GSE106464_RNA_invivo
fastq-dump --split-files SRR6248841 &
fastq-dump --split-files SRR6248842 &
fastq-dump --split-files SRR6248843 &
fastq-dump --split-files SRR6248844
wait
fastq-dump --split-files SRR6248845 &
fastq-dump --split-files SRR6248846 &
fastq-dump --split-files SRR6248847 &
fastq-dump --split-files SRR6248848 &
fastq-dump --split-files SRR6248849 &
fastq-dump --split-files SRR6248850 &
fastq-dump --split-files SRR6248851 &
fastq-dump --split-files SRR6248852
wait
fastq-dump --split-files SRR6248853 &
fastq-dump --split-files SRR6248854 &
fastq-dump --split-files SRR6248855 &
fastq-dump --split-files SRR6248856 &
fastq-dump --split-files SRR6248857 &
fastq-dump --split-files SRR6248858 &
fastq-dump --split-files SRR6248859 &
fastq-dump --split-files SRR6248861
wait
fastq-dump --split-files SRR6248860
